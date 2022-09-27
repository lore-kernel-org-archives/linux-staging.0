Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E031653
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 07:05:43 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R6Nx8q027265;
	Tue, 27 Sep 2022 07:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=mSR6OzdgSfDBN0ZXuGHLGbu4JOsjvoG1ljv3c1XJQZA=;
 b=Uxl4l0ErAwB9DAoWwDEoIi3XjUudmOdfsTLQRQGAEjFYnEn5xNR9a4Ia6pNp5yJLbgrJ
 0DkAlRvYPAQsFXGEEbmWkdLDqMioGPQS9Lr9R2FSwKrC28R0AtCnC2wkKHHbfYOtpy85
 CWBlWEM7dUvLjGzLGyYqoC0BUh/BFO1XzfZYrHFuKkhU6RKqpfKiXV8q1pGfAsAwomQ6
 3j/ZZLj2uZLoj1mEirK5gHbpHibuloHDB8wuajC8y1aa9GRkOMFP5mSmfdqsId7f7V5t
 6EW6d9ma0in4gpiRaSISjyCp7KBb2ZKNkA2I7AqRMEpgAaiYXxKxoW3/xRK5eMIxlaG+ sQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jssrwdqcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Sep 2022 07:05:41 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28R4FOZ9028008;
	Tue, 27 Sep 2022 07:05:41 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jtps4y31p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Sep 2022 07:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0aYsAlZGwdaubf4RAWjsagz3d0zCiERZ9VxJq1+UevXFXc7bSVy0DtZtEX68BrIalo/aJEoxE0ewDrx4PzwkBfSLid4JfXx42YT3QI9dBq55eTPxQ5FUjajcSCJwSyZkkMWDJw/vycvH5AHofzafzQdcC899Ddx1mn7dVvcjsA5ddmI33AnA3x6mnuSjhgg33zqDvEm5zFwV6wkCVOTyTXT2G7n1r2ja2jDzN3QExLkrJmke6HCeoQsoAZ4YxKdL1tDkoazlub8V1bffZA7s0Aqr5Hbyym7t3Gpk8mJvLyL/4q0rr5vCIJIHRlWPP3ca//7Z0lHC9EGVExur66z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSR6OzdgSfDBN0ZXuGHLGbu4JOsjvoG1ljv3c1XJQZA=;
 b=BtmiC1CL5iLP6kxunW7F3sZ4QtMUnaMLuvLmO4qLk7+SlDUVAm3JvgVJOTWr1J/zLi96mGjIBnq4lsnQyEvh2uzQRzUvrNWumgX8S3RcRPxDoSlJ8ERQcZzTra9w4t4C66a6xJGcamNtrinNGmGDlt2EAchTFj+towAUGg/9gS8V1rdfk+nU0gOOCIiRLadcTxMboSQcca4lhJR7nDM78iw7wyye3Ty4yCHDfAOP1F/dqpS7Yb80ziL3TpM2Th7bfHXdrCwAbaiUVk84jBqUw0hhjq+VTjIK6I7hn6Ze3f8XKlrpFhDwsv1eX/STwB+wGR+oXDx/H2iLY07X1644Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSR6OzdgSfDBN0ZXuGHLGbu4JOsjvoG1ljv3c1XJQZA=;
 b=cblN7sQGlW44dEm9T/pyRGZFkUE2hGi2Bmjqydkbk/XfQ4CYzaTwpb5e8lTNTgpkDeOtZEAUPWnZ2ZebInaznHXTkka4tBPG9WuIQDmNKTl8o1r7zKkWN2IFpW4mPHhXOACPbRdZaOPZgd1ai2C8RoexxlH9AwDnuOEKt6LOqQw=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by SJ0PR10MB5743.namprd10.prod.outlook.com
 (2603:10b6:a03:3ee::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 07:05:38 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::25b8:540b:9e72:ca93]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::25b8:540b:9e72:ca93%3]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 07:05:38 +0000
Date: Tue, 27 Sep 2022 10:05:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joash Naidoo <joash.n09@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry.Finger@lwfinger.net,
        phil@philpotter.co.uk, paskripkin@gmail.com,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: r8188eu: fix too many leading tabs
Message-ID: <YzKgqhrWl/ZRFjb7@kadam>
References: <20220919132310.1494-1-joash.n09@gmail.com>
 <Yy7kON0jNecPXN/k@kroah.com>
 <87y1u5xrkh.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1u5xrkh.fsf@gmail.com>
X-ClientProxiedBy: JNXP275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::22)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2358:EE_|SJ0PR10MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4dadc0-4761-4646-e9fc-08daa056ae6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N/+cN5Zj70ha0VNYmeKU2d42nNYoxgy+3uNli39esy1RIlz7y1ZQQGhMbeVO5ddEMVS2jHnLEWmi14QOmGBW6Uenb6I2QwuKYe0HbLYY88tlrXx/Az0FrsTwLUWYOV5zps7fQxolmjG5ttTNMDWOnDYEphSjPcToQv38seBmmBKK9WX49C2fWMxn+lnOFcpxVqO1ItBZON1cFgtMTvGO4WeAATlVUSzLKRh0ZdMipNzJbqo0YoYSm/KU2j8wbTgQ1hlzUetNJiQ8bq9s1zTb9uyYBq59w0ok2I/GDkJvLhqs7nZwe5nVixzQpnHD1YPDFEsB2UqgSd1Wm73spouP1lT4G+RRLvavWSxNUQho/CfKfuzIu67G4/PGBGGTYF45sma6SgN1jrZcYMUPwgBGYh4deAyYLYQuV9r2apyXdBqkkZT6HFXIHKciQSvt2I1gusFqxUw353vmJ5Ii989IRF/1UiPX/nLh3imTYEzEHWKIc/k3hABLuuaWmzDTXwuZrlIYInGpz37+xpodONBF3BxbKUXsDcshwyI+JLQKYKwt5ZfQ+NBp5pTxD8xtWpirFmHw/zPIo6ilVM8KFpH0u2L78hWfKKaVFao3+G2D+lkLfYshr7d7OVU+ZHDkVxzyc049oonu/WZZGbZqs3sCU+IirZkP8Fqk6NSzrAX1qJ4vMVJT6b3ctO4UtN/7KLFA3/AQs7w0wLi2IsA0a9K/BA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(478600001)(33716001)(5660300002)(316002)(2906002)(38100700002)(6916009)(83380400001)(44832011)(6506007)(9686003)(66476007)(66556008)(6486002)(66946007)(86362001)(6512007)(8936002)(4326008)(186003)(26005)(41300700001)(8676002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVhOYUt5VG9hMXh1NkwrOWFreUNwaTlkcGRXNktFUmJNdUF3U1pNVUZYcDc4?=
 =?utf-8?B?Ly80ZUoyZU9ndkIwbThyM2IzbjJCRi9YYTFTVFJpKzJiemJRYTBqVUtzZ1Vu?=
 =?utf-8?B?Uk5oSnhYM2lqLzU5cFJtQWNweERGeUZyUi9PeWlxaklRSlFYeGtQd1NTQ2h5?=
 =?utf-8?B?cGVXa2xJVGRRNHJZVzlWWmEzMU9TbjZoMW0wYXRLNXZLRC9zOVhGellwWmRS?=
 =?utf-8?B?ZWFUT1FtcXk1NDltdVEwb092THQ2RW5ibFZMWDVLSlUvSEwybWYzdGhsL0RL?=
 =?utf-8?B?R01jRnExRzVDOVpUVlVBbHU5RGwyN3hoQU9uN0prWS9vMk92Qk5qMjh0a0Zq?=
 =?utf-8?B?NmE4a0t6eHAwcTRqeFg3RWgxdnNBU1diTVd4aWdoQmVjZzRydjBVbTYySjg1?=
 =?utf-8?B?SkFDMmg1MVRydUZzQ3UwZUhaR0Z0elRlOXpoczl6T0hpalpMMVlKV2RqZnZa?=
 =?utf-8?B?U2ZnbnAwQmlVMS9PQ1VadzA3QjI4M0ZPSEdtbGdLUkVtVkpMK1ZaZUl0OHlK?=
 =?utf-8?B?VWxHd2V1Y2NURndCcklNKzkwNHlPdWMyeXhiLytQUGJSSmhGTktNYzNBQ1RB?=
 =?utf-8?B?Z0J5TDNCenlxYkUyY2NXN1pIRnRqd0tGZlRoN2EwM2NTMCtEVzAzcG9xaTg4?=
 =?utf-8?B?c1NWNjYwUUQ0VzRhQlQ1cWNtelRINGNyUnlHd2tZWHRTTDFmUXQ0Z04veWlG?=
 =?utf-8?B?NmVvRWpLYzRrZDUzUE9CUWp2dFFyUXU4dnUvY2EyeG9xR3daVXp4MG5tNFV2?=
 =?utf-8?B?eXdqL3BLeGIxVzdzeVdrS0hBZ3JUNTY2VE15cjB4UFo4QnV2elFickhGdXRV?=
 =?utf-8?B?WE5zeW5YcTA0S0dJTkhXSGd1cFovTWRvMEZCaDNjYnRIbmJZN1lWRTJINlFB?=
 =?utf-8?B?UW04RkNUS0RWU3pVaHdPSDYxSDNNZU1uY28wcnh4TS9mdGU1TlNJTWF5YllR?=
 =?utf-8?B?dS80QjVtMkxub2VSNlRNRFd6VmpIMnVoSTRYM1hmdXFmWDRSQWdPOWpLZTcz?=
 =?utf-8?B?YnVFaWIxdnNmQ1lLVFRJZmErZWRzRGk3M2RrLzE3dUtLKzdXcW5BNlNoQkhZ?=
 =?utf-8?B?a2tzeFFqcXN5YTlKeTJGNXcwWDBvQmRQMExFTVhzMkdaRmVBdm85dmNvT2tw?=
 =?utf-8?B?RFNFTWxsOXV0MDhzYUQ0Q2xScHZOQUptWDkzNG91dlFVWDUwR29oSGNhQ0Zl?=
 =?utf-8?B?aFkrMU12a2cwVGYvR3BaYWdQRmIraWkvcUpzdlFnNUw0b1VyRS80UmUzT0ty?=
 =?utf-8?B?c0xVQmZsbG1wYzZvTzl2bjlZZHJSS01GWXVETXozb1JZZlNWKzlXYi96eXdX?=
 =?utf-8?B?YlpwTFA0c2FoRVhxSXNCWjhWUDV2V3V1N3B3V1pLZ0YxV3pHNmtMeWxGWnNJ?=
 =?utf-8?B?RnlNSjdOQkZCMjRjMEE4R09pVDIyVXA4YzRSTFZwL0xmRzVDMDRuN3ZiYnFF?=
 =?utf-8?B?Q1NvdXZQTVZ1UjVrd0NFNENqS1B3ZHJVWjlZd1MwWW45ZDFmUEZqbVBMZHdY?=
 =?utf-8?B?TWFib3RRZkNRVVlHTHFuR1pmbFBWdFdnZzdHaHBIZE1sZlE4cU56TytuZXJ1?=
 =?utf-8?B?WEFENFFwbjMxMEEwWTNSTkFQWGExNU50eEhNK2NZaWtOVVJtS1NPZlhGaUVH?=
 =?utf-8?B?dzRLNFlub0tyMXBYVzJnWnRDSnRuWHpNZldXUDdrTzZFa1NCZC95dkpiTlJN?=
 =?utf-8?B?VVhNamFrKzh0Z3FKYXB3UFVvWnBVQ01rL3BobVc4NFJqcnBNSVpSeURWTUNG?=
 =?utf-8?B?VVFmWEI0QVZ1ZEE2WUhVaUw0Z2hjZEFzSGIvYjlRZUpIUnRoWlJBcHY0OVVN?=
 =?utf-8?B?UFd4Z2RidU5TK2JtTFFCS1BhVjJ6ZzJRdnVMSlRrZ1VvUmxsKzV3b2NpTEJr?=
 =?utf-8?B?RXE5NzQ3MUFQMEJqcnJWKzZBYzZBMnlaTGViZ1BMdjVIaHZES0dRMTVRTlBt?=
 =?utf-8?B?UWJsYnFWbGxndTdFSWhGVXhiQkhhQnJDQWJBczA5WEZkSkt3dUVnNnhuUlVs?=
 =?utf-8?B?cFJZZjFOeklOSElWcjNlN0VMeUFYbXYza1JZV0Jld2FUb01RK1hVa3htVThT?=
 =?utf-8?B?b0cyYmtZRElhMnFvdUI3M01tbFRLak9XRWlGUUFvWWYwc2c5TGQzRitscERV?=
 =?utf-8?Q?VA/VgK/zmsa5Zm3bsko3FKSE3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4dadc0-4761-4646-e9fc-08daa056ae6f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 07:05:38.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNYQuZj23rvUoo27yPsSs/z1QQXrQpJ2GB1KNxHLFu6Oi0HAYXUUuCoJdc1H6B8GaAtOASWqGu4DSilweAKIseA84TDqAqIs0JAJSXcQjGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5743
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=889 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270040
X-Proofpoint-ORIG-GUID: FHPerFb3ZygGZ8xBwcFRoQjToOw-wq-G
X-Proofpoint-GUID: FHPerFb3ZygGZ8xBwcFRoQjToOw-wq-G

On Tue, Sep 27, 2022 at 08:24:01AM +0200, Joash Naidoo wrote:
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Mon, Sep 19, 2022 at 03:23:10PM +0200, Joash Naidoo wrote:
> > > Coding style fix. Fix too many leading tabs and line length.
> > > 
> > > Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
> > > ---
> > > Changes in v3:
> > >     - Fix flipped condition mistake
> > >     - move skb NULL check before dereferencing it
> > > Changes in v2:
> > >     - Flip additional nested if conditions and don't reverse     the
> > > last if statement
> > >     - Move declarations to start of function
> > >     - Separate converting __constant_htons to htons to another
> > > patch
> > 
> > Always test-build your changes before sending them out so you do not get
> > grumpy emails from maintainers asking why you didn't test-build your
> > changes...
> > 
> > thanks,
> > 
> > greg k-h
> Hi Greg,
> 
> Indeed building and testing is a vital step before sending
> changes. Is this message referring to my V3 patch not building? Or
> referring to my earlier versions?
> 
> Before sending I built my changes with:
> 
> make M=drivers/staging/r8188eu clean
> make M=drivers/staging/r8188eu
> 

  CC [M]  drivers/staging/r8188eu/core/rtw_br_ext.o
drivers/staging/r8188eu/core/rtw_br_ext.c: In function ‘dhcp_flag_bcast’:
drivers/staging/r8188eu/core/rtw_br_ext.c:607:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
  607 |         __be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
      |         ^~~~~~
cc1: all warnings being treated as errors

regards,
dan carpenter

