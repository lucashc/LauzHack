#!/usr/bin/env sh

curl -X 'POST' \
  'http://localhost:9020/ledger/taa/accept' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "mechanism": "wallet_agreement",
  "text": "# Transaction Author Agreement V2\nhttps://sovrin.org/\n\n\n## Summary:\n\n\nThis summary is provided to help you understand your obligations when writing to\nthe Sovrin Ledger Networks-it does not have any legal effect or replace the full\nlegal text of the agreement provided below it.\n\n\n- This agreement grants you permission to write data to the Sovrin Ledger\n  Networks under certain terms and conditions.\n\n\n- You represent and warrant that the data you are writing does not violate any\n  applicable laws or infringe the rights of any other party.\n\n\n- You understand the data you are writing is public and permanent and there can\n  be no guarantee of erasure. This includes public keys and payment addresses.\n\n\n- If it is determined that the data you wrote violated this agreement, the\n  operators of the network can take steps to block it from public access.\n\n\n- The Sovrin Foundation makes no promises about the reliability or correctness\n  of the data being stored on the Sovrin Ledger Networks or the operation of the\n  Sovrin Ledger Networks.\n\n\n--------------------------------------------------------------------------------\n\n\n## Agreement: Approved by the Sovrin Board of Trustees 04 December 2019\n\n\nThis Transaction Author Agreement (the \"**Agreement**\") is entered into on the\ndate you accepted this Agreement (the \"**Effective Date**\") between the Sovrin\nFoundation, a nonprofit corporation organized under the laws of the State of\nUtah, United States of America (\"**Sovrin Foundation**\"), and you\n(\"**Transaction Author**\"), either an entity or a natural person acting as\nan Individual. Sovrin Foundation and Transaction Author are individually\nreferred to herein as a  \"Party\" and collectively as the  \"Parties\". All\nreferences to \"you\" throughout this Agreement will include that person or\nentity. You represent that you are authorized to accept this Agreement on that\nperson’s or entity’s behalf, and in the event you or the person or entity\nviolates this Agreement, the person or entity agrees to be responsible to the\nSovrin Foundation.\n\n\nBy clicking \"Accept\" or similar or writing Transactions to the Sovrin Ledger\nNetworks, Transaction Author agrees to be bound by this Agreement and all terms\nincorporated by reference. If Transaction Author does not agree to this\nAgreement in its entirety, do not click \"Accept\" or write Transactions to the\nSovrin Ledger Networks.\n\n\nIf Sovrin Foundation makes material changes to this Agreement, Sovrin Foundation will notify you\nby posting a notice on Sovrin Foundation’s website prior to the effective date of the changes. \nBy continuing to act as a Transaction Author or by otherwise writing Transactions on the\nSovrin Ledger Networks after Sovrin Foundation posts changes to their website, you agree to be\nbound by the revised Agreement.\n\n\nWHEREAS, Transaction Author desires to write Transactions to the Sovrin\nLedger Networks (each a \"**Transaction**\"); and\n\n\nWHEREAS, subject to Transaction Author complying with the terms and\nconditions of this Agreement, Sovrin Foundation grants permission to \nTransaction Author to write Transactions to the Sovrin Ledger Networks;\n\n\nFOR GOOD AND VALUABLE CONSIDERATION, THE SUFFICIENCY OF WHICH IS HEREBY\nACKNOWLEDGED, THE PARTIES AGREE AS FOLLOWS:\n\n\n\n\n## 1) Definitions\n\n\na. \"**Data Protection Laws**\" means the GDPR and any other data protection and\nprivacy laws, regulations, and regulatory requirements applicable to a party\nunder this Agreement.\n\n\nb. \"**GDPR**\" means the General Data Protection Regulation (EU) 2016/679\non the protection of natural persons with regard to the Processing of personal\ndata and on the free movement of such data, and repealing Directive 95/46/EC,\nand any amendment or replacement to it.\n\n\nc. \"**Impermissible Personal Data**\" means the Personal Data that\nTransaction Author writes to the Sovrin Ledger Networks that is not\nPermissible Personal Data.\n\n\nd. \"**Personal Data Transactions**\" has the meaning set forth in Section 3\nbelow.\n\n\ne. \"**Permissible Personal Data**\" means Personal Data that Transaction\nAuthor writes to the Sovrin Ledger Networks that is permitted under this\nAgreement and the Sovrin Governance Framework (including the\n[Sovrin Ledger Access Policies](https://sovrin.org/wp-content/uploads/Sovrin-Ledger-Access-Policies-V1.pdf)).\n\n\nf. \"**Personal Data**\" means information that relates, directly or\nindirectly, to a data subject, including without limitation, names, email\naddresses, postal addresses, identification numbers, location data, online\nidentifiers or one or more factors specific to the physical, physiological,\ngenetic, mental, economic, cultural or social identity of the data subject.\n\n\ng. \"**Process**\" or \"**Processing**\" means any operation or set of\noperations which is performed on Transactions data, whether or not by\nautomated means, such as the access, collection, use, storage, disclosure,\ndissemination, combination, recording, organization, structuring, adaption,\nalteration, copying, transfer, retrieval, consultation, disposal, restriction,\nerasure and/or destruction of Transactions data.\n\n\nh. \"**Sovrin Governance Framework**\" means Sovrin Foundation’s\ngovernance policies and rules available at\nhttps://sovrin.org/governance-framework/ or any successor website.\n\n\nUnless otherwise defined above, all capitalized terms used in this Agreement\nshall have the meanings given to them in this Agreement or in the Sovrin\nGovernance Framework and corresponding Sovrin Glossary. The Sovrin Governance\nFramework and Sovrin Glossary is incorporated into this Agreement by reference\nonly for purposes of use of such defined terms.\n\n\n\n\n## 2) Permission to Write to the Sovrin Ledger Networks\n\n\na. Sovrin Foundation hereby grants to Transaction Author a non-exclusive,\nnon-assignable, non-sublicensable, royalty free, revocable license to write to\nand use the Sovrin Ledger Networks in accordance with this Agreement and the\nSovrin Governance Framework.\n\n\nb. When authoring Transactions under the policy of Permissioned Write Access,\na Transaction Author may only write to the Sovrin Ledger Networks by using an\nauthorized Transaction Endorser. In the event that Sovrin Foundation enables\nPublic Write Access to the Sovrin Ledger Networks, Transaction Author will\nnot need a Transaction Endorser to endorse a Transaction.\n\n\nc. Once an initial Transaction has been written to one of the Sovrin Ledger\nNetworks by Transaction Author (\"**Initial Transaction**\"), the\nTransaction Author is granted permission to make additional Transactions to\nupdate the state of a previous Transaction (\"**Update Transactions**\"). Please\nnote, an Update Transaction does not remove the Initial Transaction, which\nwill remain on the Sovrin Ledger due to its immutability and may remain on\nSovrin Test Networks unless they are reset. Transaction Author may make Update\nTransactions if and only if Transaction Author was the author of the\nInitial Transaction. Update Transactions are Transactions and are subject to\nall the terms of this Agreement.\n\n\n\n\n## 3) Transaction Author Obligations\n\n\na. With regard to all Transactions, Transaction Author will:\n\n\n  1. comply with any requirements imposed by the Transaction Endorser on the\n  Transaction Author and any Transactions endorsed by the Transaction\n  Endorser;\n\n\n  2. not write Transactions containing Personal Data until Sovrin Foundation\n  approves Public Write Access and permits Transactions to contain Personal\n  Data pursuant to Section 3(b) below.\n\n\nb. If Sovrin Foundation approves Public Write Access and permits\nTransaction Authors to write Transactions that contain Permissible Personal\nData (\"**Personal Data Transactions**\"), then Transaction Author expressly\nagrees that:\n\n\n  1. It will not write any Transactions that contain Impermissible Personal\n  Data to the Sovrin Ledger Networks;\n\n\n  2. it is an independent data controller (as defined in the GDPR) of the\n  Personal Data Transactions and will be responsible for the lawfulness of the\n  Processing of such data in compliance with the Data Protection Laws;\n\n\n  3. it acknowledges and will notify all data subjects whose Personal Data it\n  Processes that functions inherent in blockchain technology may render\n  fulfilling data subject requests difficult or impossible. For example, due\n  to blockchain’s immutability, data stored on a blockchain generally cannot\n  be removed or altered once the data is confirmed on the blockchain;\n\n\n  4. it irrevocably waives any and all claims, rights and/or obligations it\n  may have now or in the future against Sovrin Foundation as a result of\n  being unable to fulfill data subject requests in accordance with Data\n  Protection Laws;\n\n\n  5. it agrees to be bound by the terms and conditions applicable to\n  Transaction Author as a controller of Personal Data Transactions under the\n  Data Processing Agreements with Stewards and Transaction Endorsers, each in\n  their roles as processors under the GDPR, and attached as Appendices A and B\n  (the \"**DPAs**\");\n\n\n  6. that Sovrin Foundation has the right to enter into the DPAs on its\n  behalf and the DPAs are made a part of the Agreement in their entirety;\n\n\n  7. by signing this Agreement, each Party is deemed to have signed the DPAs,\n  including the Standard Contractual Clauses with Sovrin Foundation and\n  Transaction Author as the \"Data exporter\", and with either a Steward or a\n  Transaction Endorser as \"Data importer\", as applicable;\n\n\n  8. at Sovrin Foundation’s request, Transaction Author will reimburse\n  Sovrin Foundation for any costs incurred by Sovrin Foundation in\n  enforcing Transaction Author’s rights under the GDPR, including but not\n  limited to fulfillment of data subject rights, rights of oversight and\n  audit, etc.; and\n\n\n  9. it irrevocably waives any and all claims that it may have now or in the\n  future that Sovrin Foundation lacks the rights to enter into the DPAs on\n  its behalf and bind Transaction Author to the DPAs’ terms and conditions,\n  including the limitation of liability therein.\n\n\n\n\n## 4) Term and Termination\n\n\na. This Agreement commences on the Effective Date and shall remain in force\nuntil terminated by either Party pursuant to this **Section 4 (Term and\nTermination)**.\n\n\nb. Either Party may terminate this Agreement: (i) if the other Party has\nmaterially defaulted in the performance of any of its obligations under this\nAgreement and has not cured such default within fifteen (15) business days of\nreceipt of written notice from the non-defaulting Party of such default or\n(ii) immediately in the event of any government sanctions or other legal\nmeasures that make it unlawful for Transaction Author to write Transactions to\nthe Sovrin Ledger Networks.\n\n\nc. Additionally, Transaction Author may terminate this Agreement upon 30 days'\''\nadvance written notice to Sovrin Foundation and ceasing all use of the\nSovrin Ledger Networks.\n\n\nd. Upon termination or expiration of this Agreement for any reason the rights\ngranted to Transaction Author by Sovrin Foundation under this Agreement\nautomatically terminate.\n\n\n\n\n## 5) Representations and Warranties; Disclaimer\n\n\na. By Sovrin Foundation.\n\n\n  1. THE SOVRIN LEDGER NETWORKS AND THE SOVRIN NETWORK ARE PROVIDED AS-IS WITH\n  ALL FAULTS. TO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, THE SOVRIN\n  FOUNDATION MAKES NO REPRESENTATION OR WARRANTY CONCERNING THE ACCURACY,\n  RELIABILITY, OR COMPLETENESS OF ANY INFORMATION OR DATA OBTAINED OR DERIVED\n  THROUGH THE USE OF THE SOVRIN LEDGER NETWORKS AS THE SOVRIN LEDGER NETWORKS\n  OPERATE ON A DISTRIBUTED NETWORK AND SOVRIN FOUNDATION DOES NOT CONTROL\n  THE INFORMATION OR DATA WRITTEN TO THE SOVRIN LEDGER NETWORKS. THE SOVRIN\n  FOUNDATION DISCLAIMS ANY OTHER REPRESENTATIONS OR WARRANTIES, EXPRESS OR\n  IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY OR\n  FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT, ACCURACY OR\n  COMPLETENESS OF DATA.\n\n\n  2. As the architect of the Sovrin Network and administrator of the Sovrin\n  Governance Framework, Sovrin Foundation is an independent controller of\n  the Personal Data Transactions. In no event will Sovrin Foundation be\n  held liable for the actions or omissions of Transaction Author arising out\n  any Personal Data that Transaction Author writes to the Sovrin Ledger\n  Networks in breach of this Agreement and the Sovrin Governance Framework,\n  including but not limited to any Impermissible Personal Data.\n  Notwithstanding the foregoing, if Transaction Author writes Permissible\n  Personal Data to the Sovrin Ledger Networks in express compliance with this\n  Agreement and the Sovrin Governance Framework, Sovrin Foundation is\n  responsible for the lawfulness of such Processing once such Permissible\n  Personal Data is written to the Sovrin Ledger Networks.\n\n\nb. By Transaction Author. Transaction Author represents and warrants:\n\n\n  1. if a natural person, he or she is 16 years of age or older;\n\n\n  2. it has all necessary rights and permissions to write the Transactions;\n\n\n  3. the Transactions do not and will not violate any applicable law;\n\n\n  4. the Transactions will not contain data or information that infringes or\n  misappropriates the intellectual property rights of any third party;\n\n\n  5. it understands that the Sovrin Ledger Networks operate on a distributed\n  network and that Sovrin Foundation disclaims any responsibilities with\n  respect to access of data from the Sovrin Ledger Networks;\n\n\n  6. it understands and acknowledges that Sovrin Foundation does not control the\n  transfer of data between Nodes and over communications facilities,\n  including the internet, and that the Sovrin Ledger Networks may be subject\n  to limitations, delays, and other problems inherent in the use of such\n  communications facilities;\n\n\n  7. it understands and acknowledges that there is regulatory uncertainty\n  regarding the Sovrin Ledger Networks’ compliance with Data Protection Laws\n  as it relates to Permissioned Write Access, Public Write Access, and\n  Personal Data, including cross-border transfers of data, Processing of\n  Personal Data, the right to effective erasure of data, as well as the scope\n  and nature of Personal Data itself;\n\n\n  8. it understands and acknowledges that Sovrin Foundation may modify, at any\n  time, its Sovrin Ledger Access Policies and the terms of this Agreement and\n  any other agreement or document related to the Sovrin Ledger Networks based\n  on new information, guidance, or Data Protection Laws; and\n\n\n  9. it understands and acknowledges that a Steward and/or Sovrin Foundation\n  may obscure a Transaction if (i) the Steward or Sovrin Foundation is\n  required to do so by a court order or applicable law or (ii) the Steward or\n  Sovrin Foundation has evidence that the Transaction violates the terms of\n  this Agreement or any applicable law.\n\n\n\n\n## 6) Indemnification\n\n\na. To the fullest extent permitted by applicable law, Transaction Author will\nindemnify and hold harmless Sovrin Foundation, and each of its respective\nofficers, directors, agents, partners and employees (individually and\ncollectively, the \"**Sovrin Parties**\") from and against any losses,\nliabilities, claims, demands, damages, expenses or costs (\"**Claims**\")\nbrought by a third party arising out of or related to (i) Transaction Author’s\naccess to or use of the Sovrin Ledger Networks in violation of this Agreement;\n(ii) Transaction Author’s violation, misappropriation or infringement of any\nrights of another (including intellectual property rights or privacy rights);\nor (iii) Transaction Author’s violation of applicable law.\n\n\nb. Transaction Author agrees to promptly notify the Sovrin Parties in writing\nof any Claims, cooperate with the Sovrin Parties in defending such Claims and\npay all fees, costs and expenses associated with defending such Claims\n(including attorneys’ fees). Transaction Author also agrees that the Sovrin\nParties will have sole control of the defense or settlement, at the Sovrin\nFoundation’s sole option, of any Claims. This indemnity is in addition to, and\nnot in lieu of, any other indemnities set forth in a written agreement between\nTransaction Author and Sovrin Foundation or the other Sovrin Parties.\n\n\n\n\n## 7) Governing Law and Forum\n\n\nThis Agreement is governed by the law of the State of Delaware, without\nreference to conflict of laws principles; provided that, if Transaction Author\nis a governmental entity, this Agreement is governed by the law in which such\ngovernmental entity is established. All disputes arising out of or in connection\nwith this Agreement shall be finally settled by binding arbitration under the\nRules of Arbitration of the International Chamber of Commerce (the \"**Rules**\")\nby a single arbitrator appointed in accordance with said Rules. Arbitration\nproceedings will be held in London, England. Unless the Parties otherwise\nmutually agree, such arbitration shall be conducted in the English language by\nelectronic exchange of documents and by video conference. The arbitrator shall\nissue a reasoned decision, including findings of fact and conclusions of law.\nThe arbitrator shall require exchange by the Parties of documents relevant to\nthe issues raised by any claim, defense, or counterclaim or on which the\nproducing Party may rely in support of or in opposition to any claim, defense,\nor counterclaim, with due regard for eliminating undue burden and expense and\nthe expedited and lower cost nature of arbitration. At the request of a Party,\nthe arbitrator may at his or her discretion order the deposition of witnesses.\nDepositions shall be limited to a maximum of three depositions per Party, each\nof a maximum of four hours duration, unless the arbitrator otherwise determines.\nDemand for arbitration may be initiated by either Party on fifteen (15) days\nwritten notice by email to the other Party’s designated representative, together\nwith a written specification of the grounds for the dispute and the relief\nrequested. By agreeing to binding and non-appealable arbitration, each party\nunderstands that they each forever give up and waive any right which each Party\nmay have to resolve any such claim, difference or dispute by court or jury\ntrial. Notwithstanding the foregoing, either Party may bring a proceeding\nseeking equitable or injunctive relief solely and exclusively in the state and\nfederal courts located in Wilmington, Delaware, to prevent the infringement of\nintellectual property rights or the disclosure of confidential information. Each\nParty hereto consents to the exclusive jurisdiction of such courts for the\nadjudication of any such equitable or injunctive relief, as well as for any such\nmatters that are excluded from or fall outside of this arbitration provision.\n\n\n\n\n## 8) Limitation of Liability\n\n\nEXCEPT IN THE EVENT OF EITHER PARTY’S GROSS NEGLIGENCE, WILLFUL MISCONDUCT OR\nFRAUD, IN NO EVENT SHALL EITHER PARTY BE LIABLE FOR ANY INDIRECT, INCIDENTAL,\nEXEMPLARY, PUNITIVE, SPECIAL, OR OTHER CONSEQUENTIAL DAMAGES UNDER THIS\nAGREEMENT, INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS\nINTERRUPTION, LOSS OF PROGRAMS OR DATA, OR OTHERWISE, EVEN IF THE OTHER PARTY IS\nEXPRESSLY ADVISED OF THE POSSIBILITY OR LIKELIHOOD OF SUCH DAMAGES. EXCEPT IN\nTHE EVENT OF EITHER PARTY’S GROSS NEGLIGENCE, WILLFUL MISCONDUCT OR FRAUD, IN NO\nEVENT SHALL EITHER PARTY’S LIABILITY UNDER THIS AGREEMENT EXCEED $250,000 USD IN\nTHE AGGREGATE, PROVIDED THAT THERE WILL BE NO DOLLAR CAP ON LIABILITY FOR\nDAMAGES ARISING FROM VIOLATIONS OF DATA PROTECTION LAWS. IN THE EVENT OF EITHER\nPARTY’S GROSS NEGLIGENCE, SUCH PARTY’S LIABILITY UNDER THIS AGREEMENT SHALL NOT\nEXCEED $500,000 USD IN THE AGGREGATE. IN THE EVENT OF EITHER PARTY’S WILLFUL\nMISCONDUCT OR FRAUD, THERE SHALL BE NO DOLLAR CAP ON SUCH PARTY’S LIABILITY\nUNDER THIS AGREEMENT.\n\n\n\n\n## 9) Miscellaneous\n\n\na. Notice. Any notice, payment, demand or communication required or permitted\nto be delivered or given by the provisions of this Agreement shall be deemed\nto have been effectively delivered or given and received on the date\npersonally or electronically delivered to the respective Party to whom it is\ndirected, or when deposited by registered or certified mail, with postage and\ncharges prepaid and addressed to each respective Party. For the Transaction\nAuthor, notices will be sent to the agent service endpoint of the Transaction\nAuthor’s DID as long as Transaction Author authorizes such a connection or\nsent via other mechanism agreed to by the parties. For Sovrin Foundation,\nnotices will be sent to Attn: Legal, 86 N University Ave, Suite 110, Provo, UT\n84601.\n\n\nb. Severability. If any provision of this Agreement is held invalid, illegal,\nor unenforceable, the validity, legality, and enforceability of any of the\nremaining provisions of this Agreement shall not in any way be affected or\nimpaired.\n\n\nc. Relationship of the Parties. This Agreement does not create a partnership,\nfranchise, joint venture, agency, fiduciary or employment relationship between\nthe Parties. Neither Party will represent that it has any authority to assume\nor create any obligation, express or implied, on behalf of the other Party,\nnor to represent the other Party as agent, employee, franchisee, or in any\nother capacity. There are no third-party beneficiaries to this Agreement.\nNeither Party shall make any proposals, promises, warranties, guarantees, or\nrepresentations on behalf of the other Party or in the other Party’s name.\n\n\nd. Assignment. Neither Party will voluntarily, or by operation of law, assign\nor otherwise transfer this Agreement without the other Party’s express prior\nwritten consent which will not be unreasonably withheld, provided that no such\nconsent is required for an assignment or transfer to a wholly or majority\nowned subsidiary or to a successor in interest by reason of merger or\nconsolidation or sale of all or substantially all of the assets of such Party\nrelating to the subject matter of this Agreement.\n\n\ne. Waiver. The waiver by either Party of a breach, default, delay or omission\nof any of the provisions of this Agreement by the other Party will not be\nconstrued as a waiver of any subsequent breach of the same or other\nprovisions.\n\n\nf. Entire Agreement. This Agreement, including all documents incorporated into\nthis Agreement by reference, constitutes the entire agreement of the Parties\nwith respect to the subject matter of this Agreement, and supersedes any and\nall prior agreements and understandings of the Parties, whether written or\noral, with respect to such subject matter. This Agreement supersedes all prior\nTransaction Author Agreements between Sovrin Foundation and Transaction Author\nwith respect to the subject matter hereof.\n\n\ng. Modification of This Agreement. Sovrin Foundation reserves the right to\nmodify this Agreement at any time in accordance with this provision,\nincluding, but not limited to, changes in applicable law or guidance from any\njurisdiction. Sovrin Foundation will post an amended version of this Agreement\non its website at least forty-five (45) days prior to the date on which all\nTransaction Authors must begin operating under the amendment (the \"**Amendment\nCutover Date**\"). If Transaction Author continues to Author Transactions to\nthe Sovrin Ledger Networks after the Amendment Cutover Date, such continued\nuse will constitute acceptance of the amended Agreement.\n\n\nh. Counterparts. This Agreement may be executed in two or more counterparts,\neach of which will be deemed an original, but all of which taken together will\nconstitute one and the same instrument\n\n\ni. Survival. Any terms that by their nature survive termination or expiration\nof this Agreement shall survive.\n\n\nj. Governmental Entities. If Transaction Author is a governmental entity and\nit determines that GDPR does not apply to it and its Processing of\nTransactions, then:\n  - a. to the extent that the GDPR requirements referenced in this Agreement are\n  equivalent to the requirements under Data Protection Laws in its own\n  jurisdiction, it will comply with any such requirements; and\n\n\n  - b. to the extent that GDPR requirements referenced in this Agreement differ\n  from requirements under Data Protection Laws in its own jurisdiction, it\n  will comply with the requirements under its own legislation.\n\n\n\n\n## Appendix A\n\n\n- **Steward Data Processing Agreement**\n[LINK](https://sovrin.org/wp-content/uploads/Steward-Data-Processing-Agreement-V1.pdf)\nAS OF THE EFFECTIVE DATE OF THIS TRANSACTION AUTHOR AGREEMENT\n\n\n\n\n## Appendix B\n\n\n- **Transaction Endorser Data Processing Agreement**\n[LINK](https://sovrin.org/wp-content/uploads/Transaction-Endorser-Data-Processing-Agreement-V1.pdf)\nAS OF THE EFFECTIVE DATE OF THIS TRANSACTION AUTHOR AGREEMENT\n\n\n(c) 2019 by Sovrin Foundation. This work is licensed under the Creative Commons\nAttribution-ShareAlike 4.0 International License\n(http://creativecommons.org/licenses/by-sa/4.0/).",
  "version": "2.0"
}'