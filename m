Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE93FE6
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 09:08:11 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19588YJw029400;
	Tue, 5 Oct 2021 09:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+CvUSEYSCEFkB+0W9hFrwgxzZuHnwRdgoWUXYxly8Xk=;
 b=ZJ6DLY6izVoXtjQGHEydzWfRhtLxkTnnJike2nni++vPilA257V9RoDB2GdUaPrRE19v
 NYmt9xQtSm4ukH9VmN0/0Xtlt4wi03ahnjy4PI/4ZLhPyw38SugsWdmHg/oSj+05NYwk
 ntPltbBf6cMwnu9BfAUi9o31WwbZzocpZIT3/iBhk59/SsgcvhUd053Pcc06SzqaTYhu
 VTIbj43vZwtgQERYqrZcRxL/QCREQlERTWm20K61BNvm9qDNl+D0IPcKoEieOunRQrYC
 17U1nTRs8YpNaSygWE7dFnZ7gIDtMOqvMao33HS2o3CB3V/bXELkgKsMmDtth9fjyT/M Jw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3bg42kny4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Oct 2021 09:08:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19596f90169463;
	Tue, 5 Oct 2021 09:08:04 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2041.outbound.protection.outlook.com [104.47.56.41])
	by userp3020.oracle.com with ESMTP id 3bf16sq4jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Oct 2021 09:08:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ailzujnftyv8cXdMeGdV/ATzjIjbYWWMc57++70cWWKyHHPjRQe0grbi5g/FHx/PFSfWLyJxF8hkYNVdKwg34UejzFFk4ZLmVxr6g6fd2BI4+Rnf4PUsOV1DQt/JqqLovKSGZHJzOPiCtWNUZsFbvyrk93TlXYo5uLA/L6v5shZaAChVNR2QojW5KXWxm1b2rwvnsmgPU9YDtWUAGFBgim5icdjHEIHYUEq7jP3oy9xGhAXkKklB0g5OCX9wFwcHANWJZ9fPpw7RPv47ddlz5/rcBZl+FXl0qg3HoaKjnFvviACdO1oRDafsH6R28AR0PfV9wEBUkTWRQDExTiQYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CvUSEYSCEFkB+0W9hFrwgxzZuHnwRdgoWUXYxly8Xk=;
 b=XkzRoFSYtS9syIaHFZtPaiPkB0qbZ7KklKXlYepZqb8knqcwOZcf/TXf/0TayDy0GAKsP1lJWWa2aUL9iE6lVLNpHJHMOuoP183/7S/wcWmG9QII19Dclh9nkcnsALwVZP8G24JKhEbTBxnAtaooY/UFWRFmII9kEuhKxOCq+ZhD1Lq01HDmaQ5yN/ii8guFns5pq8yAf94YqEg1eqjxxUVsT17Eg2AjYKe+oJRwN6dMP7WPVp8fBgl5UTFx7b4aqEb8KyW9vKshi56gTrSoJxdHFnO0nq8BjfokTIGMlueKvl0b4GiX1Lhwc+VvslF3Vqoi0Iwr47Bcv6SqiOHdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CvUSEYSCEFkB+0W9hFrwgxzZuHnwRdgoWUXYxly8Xk=;
 b=VsNobaI0jNxKayOxPZBg0VAbyr0ENlUz+TYe/arblJWmEdkrP6oIc1DCT+42PId0TrVXQT9CHYfS75rsb/N5C21UP13+cuoSXwgpEDJF++EabfK/HU3q2G0R9zVBd0IGUtqUhKmKcWX293CQhdxF7gkewrkDagln0mno2Z38cMY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1824.namprd10.prod.outlook.com
 (2603:10b6:300:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 09:08:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 09:08:02 +0000
Date: Tue, 5 Oct 2021 12:06:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: hdegoede@redhat.com
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: Add rtl8723bs sdio wifi driver
Message-ID: <20211005090646.GA18431@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0083.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0083.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend Transport; Tue, 5 Oct 2021 09:08:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cf20788-3811-44b0-ce81-08d987dfa22a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1824EEA04CFA4118B275679B8EAF9@MWHPR10MB1824.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wXc4Ne41/OdcjIS41h9RFBPxiWzmlUh9ndqrcPsFA1dJ7W+C6dw+nl6T2E6B3Er67JqTOrV+16bNMCtGSbaq0qmDNhdb/wJ86UEO3M/qn2NlsVWLB+VcfZk3NeevHpPTvJgnVj2mAxLrP3UkSKzlj4zBLzB5reU8gYqNymPb2WVBTHFNqhULo9o8Qa4iK8bLuFw+0LBp5AkfqSF4ROrhKBhCO+e451gcamcohCp8jn10Hgmj5rUuimB+RjYdeLgm7g5Qdxeg35TNYDPH2neDlffxktqNc+W2CbAebDMRs8tW6hPr6T/5h6jX3GRuYI/xsbCMuLiHgP5LbeJoQmMGV/cz+djn1fHVToFxxYWP75Qn8BSqgZDUFXsscj/Rc2QBg05eILLP/k5WbeaveY1qSa/vv4URsbpe2/O7oPr25akc/oMy+onuCI/BvDmbUYwvi0yq0OXnRirM2OLWxBY1kUjzBI+8CQDWBVdks5tznIxt2WW3KE3v5QOjEnGMOJ8lWGv/aCwsOGnF3Qv8C37vKL7salnX72FzZext2vRovlv7EAWA2Iyn/CjQMLhDxCpHY+B+f1pFexRznq/zKYKoZtV1N0CMtlJxXUJUbVtlayKMWCoTsAaRaxulKIbvEGFCUtLlV1CNFOINuYN8O2/F3nqC+PSZk4vKHr4bp0zxCu9ltOzzlHd0cjchmh2+SJHAFzKLAJc05hciuqQP3gz7qA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(44832011)(6496006)(9686003)(33656002)(956004)(8936002)(9576002)(6916009)(1076003)(83380400001)(86362001)(38350700002)(186003)(38100700002)(66476007)(66556008)(66946007)(52116002)(508600001)(2906002)(6666004)(26005)(316002)(55016002)(33716001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5/dJqAATlKdQ+9Ab+9/vyv2zdode7gL3TcWsQOlm/0niL1NC6sleDwlSzLLu?=
 =?us-ascii?Q?cH8CYyqW10Wjq2xmw0saVrSyCcVtPDhvkOhQuHVvqVlacrd7+yxF6usjw7hS?=
 =?us-ascii?Q?0LHtwJZf39TTFWV/HB08a3BQuR7PL11wOGWamZq3N8o+PNcOXCc4916aOBWg?=
 =?us-ascii?Q?05iS8CzwxdTgGEqqu07WGS2/a9GP4OkSvEp8x55dxflSdelMuCqeRUCAUuyv?=
 =?us-ascii?Q?p17X+uxPA+PSX5nq5xPc42KyXYjzAPBkCCV6ezCJJ+qG1cR8MClDSwxVejgO?=
 =?us-ascii?Q?3XU3NjjeX8i+mALoJF+GHekrtQdtYLIG9P/wNMcs7pujryi/t1j5vVC1jsE3?=
 =?us-ascii?Q?nRRK59xZVmDawrXNzQ9w7FxTmQ0UYjwMqUC1G7f97OOdsJdFMNAd6YY+loDA?=
 =?us-ascii?Q?e4KGvF0e/Lnl9lIkM7CMzZzaRUFWKqImbZRNpcRnGL3gdJAfjolyREIUE0Oe?=
 =?us-ascii?Q?KC7n8zdAiLoqGs6iCHQfX8M2nhYWQVt82HrKaC3mfROb8l5LeAguDf91QBmJ?=
 =?us-ascii?Q?Pw39/7Rf53xymCWIndLITVXk0sQqMso9OQIwIo5yrCDBTGyErbpT1QgvYpdh?=
 =?us-ascii?Q?2MAlhXn3RB1BQOLu8IPHNlPujVcgs2xLs2l0tOeEhIllaee6PaFNMwywO0SI?=
 =?us-ascii?Q?+XY9rtSCgBfjKrNocYNwL2BZc+H9p+vNFwH0PkUZ2kktG7QqYNlIyTNVo9Mq?=
 =?us-ascii?Q?12u/nvSXRU7YYXy56+GBpJZPKadKXssCHXeYxy4HNKECGcaFxH18OuCSKuI5?=
 =?us-ascii?Q?wzZmD7xTv/Qqix0uQTSV/2kOFOH8I3PJqN/Q3Y+uso2YVY/eCkMlkhVCSwGI?=
 =?us-ascii?Q?OUpV8EVHUfp//sv+wD1nS5aMNKjGBDuxJyTahA8/9PUX1Ak5eTZ6F2vaz/DJ?=
 =?us-ascii?Q?/wgYvCqmyIf2V9llD9HWPGO9ZVuPxYzS2A4/SaqHLfd6Mhaxq0jITM1SPZ5e?=
 =?us-ascii?Q?RFo4bQOcN6fu/z8Rn6aTkXxDkJ8tpMQ0o+juefFlNvQkXYwa37xfylA1u8yi?=
 =?us-ascii?Q?EXbQFbqhmdA9IpSo7gDKwE6q/dT2/v9BOEmDigmmBslkUvGHHIXQ4W8jyRKj?=
 =?us-ascii?Q?6QUJlA09MFdg4CDRitM/B8G1Rz6fkvDNrDsW2KdqISEnRB4fppXlI9gpwGhU?=
 =?us-ascii?Q?RddwpYe03Q8x9vQFNLXSSlsvFHAMO8FNRd8W7ivVD6C3c38q0O1JOkcMBXZw?=
 =?us-ascii?Q?K/LQ8hpeapEE/UFHKkQDbT2I82CypwAKrqqF/VcNbGh4DX4aIHBDPSq+jbdR?=
 =?us-ascii?Q?OD4BAdyrd2IRrUC7f9FptSPcX/+VfiCnkMIAVs/9NQVRVQGECM61t9hQ+1c+?=
 =?us-ascii?Q?KoAxbqmKjaIX20k3SXQb63Fa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf20788-3811-44b0-ce81-08d987dfa22a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 09:08:01.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mWHn9MQpwUj6NZ8WC6c8k6KN+ilI60+3zS0sPQ+dwhJNw+ai6UJKY+4abMnLK7Y84OKi4c8HdUwGdWvOins0Qwkhvu1I+nzkqZ7ohGJEJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1824
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050052
X-Proofpoint-GUID: 5NhuwA0j5cNFmlhj9l0MdtTL0gv3Z5W8
X-Proofpoint-ORIG-GUID: 5NhuwA0j5cNFmlhj9l0MdtTL0gv3Z5W8

Hello Hans de Goede,

The patch 554c0a3abf21: "staging: Add rtl8723bs sdio wifi driver"
from Mar 29, 2017, leads to the following Smatch static checker
warnings:

    drivers/staging/rtl8723bs/core/rtw_security.c:1404 rtw_BIP_verify()
    warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)

    drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:4058 collect_bss_info()
    warn: not copying enough bytes for '&le32_tmp' (4 vs 2 bytes)

drivers/staging/rtl8723bs/core/rtw_security.c
    1372 u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
    1373 {
    1374         struct rx_pkt_attrib *pattrib = &((union recv_frame *)precvframe)->u.hdr.attrib;
    1375         u8 *pframe;
    1376         u8 *BIP_AAD, *p;
    1377         u32 res = _FAIL;
    1378         uint len, ori_len;
    1379         struct ieee80211_hdr *pwlanhdr;
    1380         u8 mic[16];
    1381         struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
    1382         __le16 le_tmp;
    1383         __le64 le_tmp64;
                 ^^^^^^^^^^^^^^^

    1384 
    1385         ori_len = pattrib->pkt_len-WLAN_HDR_A3_LEN+BIP_AAD_SIZE;
    1386         BIP_AAD = rtw_zmalloc(ori_len);
    1387 
    1388         if (!BIP_AAD)
    1389                 return _FAIL;
    1390 
    1391         /* PKT start */
    1392         pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
    1393         /* mapping to wlan header */
    1394         pwlanhdr = (struct ieee80211_hdr *)pframe;
    1395         /* save the frame body + MME */
    1396         memcpy(BIP_AAD+BIP_AAD_SIZE, pframe+WLAN_HDR_A3_LEN, pattrib->pkt_len-WLAN_HDR_A3_LEN);
    1397         /* find MME IE pointer */
    1398         p = rtw_get_ie(BIP_AAD+BIP_AAD_SIZE, WLAN_EID_MMIE, &len, pattrib->pkt_len-WLAN_HDR_A3_LEN);
    1399         /* Baron */
    1400         if (p) {
    1401                 u16 keyid = 0;
    1402                 u64 temp_ipn = 0;
    1403                 /* save packet number */
--> 1404                 memcpy(&le_tmp64, p+4, 6);
                                ^^^^^^^^^^^^^^^^^
    1405                 temp_ipn = le64_to_cpu(le_tmp64);
                                                ^^^^^^^^
This code is copying 6 bytes into a u64 and then treating it as little
endian data.  The problem is that the last two bytes are uninitialized
garbage data.  I think if we set "__le64 le_tmp64 = 0;" at the top that
would probably work, right?

I could have sent a patch but this code is weird enough that I was
hoping for a second opinion.

The bug in collect_bss_info() is a similar uninitialized data issue.

    1406                 /* BIP packet number should bigger than previous BIP packet */
    1407                 if (temp_ipn <= pmlmeext->mgnt_80211w_IPN_rx)
    1408                         goto BIP_exit;
    1409 
    1410                 /* copy key index */
    1411                 memcpy(&le_tmp, p+2, 2);

But this part seems totally wrong again because we haven't incremented
p.  p + 10?

    1412                 keyid = le16_to_cpu(le_tmp);
    1413                 if (keyid != padapter->securitypriv.dot11wBIPKeyid)
    1414                         goto BIP_exit;
    1415 
    1416                 /* clear the MIC field of MME to zero */
    1417                 memset(p+2+len-8, 0, 8);
    1418 
    1419                 /* conscruct AAD, copy frame control field */
    1420                 memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
    1421                 ClearRetry(BIP_AAD);
    1422                 ClearPwrMgt(BIP_AAD);
    1423                 ClearMData(BIP_AAD);
    1424                 /* conscruct AAD, copy address 1 to address 3 */
    1425                 memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
    1426 
    1427                 if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
    1428                         , BIP_AAD, ori_len, mic))
    1429                         goto BIP_exit;
    1430 
    1431                 /* MIC field should be last 8 bytes of packet (packet without FCS) */
    1432                 if (!memcmp(mic, pframe+pattrib->pkt_len-8, 8)) {
    1433                         pmlmeext->mgnt_80211w_IPN_rx = temp_ipn;
    1434                         res = _SUCCESS;
    1435                 } else {
    1436                 }
    1437 
    1438         } else {
    1439                 res = RTW_RX_HANDLED;
    1440         }
    1441 BIP_exit:
    1442 
    1443         kfree(BIP_AAD);
    1444         return res;
    1445 }

regards,
dan carpenter
