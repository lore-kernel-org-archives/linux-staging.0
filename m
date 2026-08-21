Received: from CP3P284CU006.outbound.protection.outlook.com (mail-brazilsouthazolkn19012055.outbound.protection.outlook.com [52.103.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A462837703B
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 04:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285588; cv=fail; b=T2udxqKpmaCgZevVZmFrBq6Y/AXHHvmUvY3Ln/svEa82kM8Ai+XOZ8dH8syh8x2xFgfZG4hdDRA+lgjL5LMyPHrjCp4O440cuIciulBsQMI7qMk4gUeC9b65ca1GQOsDHFjMqpMYRdGiUY1sk9D4QqJZOnLcvvFu1pmdTpnqVvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285588; c=relaxed/simple;
	bh=JDkCicDO6Mj9sddVOktVZVdOpL1EgrIsnl4mOgZ6BM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G13xWRAnLpYaSSSR9YrGPYnmspswZgP+hgzA4+kNBb+jpqYq68mOrYY/thhUXCVAwXZ3QKzf7Uy4OZa0WPKNjjPE2LzZ7+UOlJYF839/ysqFsAgQ0oVb0bT/lIDWOAlocX+em50Kc2AVq9R0GQ+mSlh9+YGBo1tlkyyPonCKXPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=N9/uJc8E; arc=fail smtp.client-ip=52.103.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="N9/uJc8E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ9mnUJO65K9lGgj8tGh2b6YYdomyytr7WrlFbJj6Hy6CmM/zeXERke7mE9WJ3HRFl+nbql1JT3YvvpEIflBliPYteCQchjwc3BT/U/m4Zy8rVksKlgXLqjfqg4AAO8I7FqnAH0iNkm2rPmLwmZOvIYB3rtmh9/6/0HQmXA83NzAfTSNvSEe4/7ETVz+uKcmW5jemtKQJE45Bjywp9f6uoGYc42CVMUIbPiG4PL6FO6uKAwBvycXAr5cYMBUwDPhrJi9acydRssUT1X/zAf9Zdnnk4q22TXHxhZe83FDjZxWlIHtlqhm34VyZZ1WwmE8ypasb8n0J4YwyuWdeD6NPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqBH/YayStua+cuPALuNeP9hh1fkiZfTIHFqg6hpCw4=;
 b=eDlNyT0BuzgPGJmV05aXaXqp8XUZ28wOYYcBOF0ZLD/soofZ1iLMXIWSmidqjVufDgKYHRLcbkpfKf7rApTXhbzauOdpx7V8oF7rG+ASWwJ+TJ63mZcJXbFNeCqf+2m1XAfgpS1+Ig1PmzVQA4ABvW1bcH2eujcvK7De/EOLJWkNBf+WL8zpeYGJVtgpr2VdpEThuEa7N0cfP0Eq0BU1b7oecHJcmzsuS9wh/8y1RywbS9AAUegE2Ghx9wHLl2bhAHizfVcV8d62AUHP98bVkCKBKdM6Ry5/bMWRyFqURRJ1w4yq+2wKgGDJotwCarwVfqpqczIPpgCZkCsXx/WY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqBH/YayStua+cuPALuNeP9hh1fkiZfTIHFqg6hpCw4=;
 b=N9/uJc8ExSYtDFc4GuNrrtzcqe+FYSk6d/OydUrLQ4oL3TOX7grKs9e/iiZ7wB0IWFdOJdQOvlC0iy7zRVmH4IY1idUIZ6LBa9UmLFKmAJSKF4asaqxxP6t3NTZVrzgHvR1x5Q2/IMSkegJg8Apq0WwcAf92gVEvf96QerDxox2HxjfmTLrwv2wpZcNdouO8HC/mjoiH7AL/qkcHr3B0EZo7dIurVFKGLBtkwMMokl0Qsaw2OKhJ11ou1zUVz2uHBae8+dDEvrunBab09sasLs4CNdNrfFeC93xt+jw3jWnLxw7W2ehCpwdgWv7zBAiT+keHj9WuyOISJ8cb35NFTw==
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:9c::8) by
 CP8P284MB2735.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2e0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 04:13:04 +0000
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f]) by CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 04:13:04 +0000
From: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Subject: [PATCH 1/3] staging: octeon: fix style issues in ethernet.c
Date: Fri, 21 Aug 2026 01:12:53 -0300
Message-ID:
 <CPYP284MB085499A0F516D64E9596B9B6FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP5P284CA0016.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:95::21) To CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:9c::8)
X-Microsoft-Original-Message-ID:
 <20260821041255.1616843-2-tiago.panizio@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPYP284MB0854:EE_|CP8P284MB2735:EE_
X-MS-Office365-Filtering-Correlation-Id: 337d24b2-85b6-4cfa-076a-08deff3a7d39
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|15080799012|24021099003|23021999003|8022599003|41001999006|25010399006|5072599009|2607281247196008|3071699003|12091999003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mY+5GXouRgfGgen4iwtNgiYSBDbW7Nkg/W6UwrzlBGRUfHsvZoK/2APxiTLN?=
 =?us-ascii?Q?QpAm6OmCCds9xy4wlEuNoEhK4fCievfwm9T/gTkENHUbX77lUK5jDkojT6+3?=
 =?us-ascii?Q?oLWp+ZZwBYydurfUt5Eae1HS5Z11VM6a1UwPyjswUktdvxIJq7A2jKTzOGhu?=
 =?us-ascii?Q?yNQizHGxB4NnplLFPcU8xXRZSEpdV93WbGsPIoMHWV7JnumG2N/I8Oa22TZ/?=
 =?us-ascii?Q?qBjRfpzsqOccsVBiLKKbSc+6vs1Ie9O9mhTW7nCTStaGOcoQFhU2oULTIqOl?=
 =?us-ascii?Q?8MEhV7BcgOVjW6s+CbWuulTLD2/wpOlmh4Y5O7n4KdXPuxzaU1G5WWrp7/oz?=
 =?us-ascii?Q?3KZblm0BTjqw2MN+DYnORI/5roNykxWUXRjovmVZPdMRnVhqIDVtRXL3dSch?=
 =?us-ascii?Q?c3Ob0OuKpfJtMTu3f9Gr7eQM+MGIO0nJUKUqsDOGnSO5RuV5YtM0VmAVVF1h?=
 =?us-ascii?Q?QKDxz3+mN7UHHJ8Jph1hyjmEqh/HUHF7fPI4HhkU6OH6luUPGouVbvJnBzcJ?=
 =?us-ascii?Q?aGwktIoBEnV61tDJLet/O8+ID1yBEH5Ehy765kwGDaxCh6iBZ63zJavzZPrH?=
 =?us-ascii?Q?V2jHuQIxz/SiUEuj5f2WnHgffoz2elFN05ZW60j2H6sUL/4WkD1J00jJeEMB?=
 =?us-ascii?Q?5YRaCnzlAJsLinuMugA28SmZYi9dsLRE7NbJ4eg9cEtz6YbOUwsmOupQf7mA?=
 =?us-ascii?Q?4XGtyj3xX6qDWZ54+d0A67OTDItLiOT+/caDcC21rlUTU+qiHb3oQZopfnep?=
 =?us-ascii?Q?LUlZaU+i4y9XrbT/tkhTE/Sx8i3dgCLa8yupRgFhrx9MBFIxBwSjEDMIuJ+v?=
 =?us-ascii?Q?6XYh16Xqi8HjLQuDdFSpwp8KN3E3JX4Zy/8dIjg+b4DeF1cSMxl3EiXqc1eO?=
 =?us-ascii?Q?qdJzS6Uw21qls4DsIJqa/bErfTmW7rNEdzM4ZnfrP+iaOZPCOJyY+rOnxOER?=
 =?us-ascii?Q?ZRv43XyBhciUUebBdyP/XiRub3W6Z5yZcA8+jr8WEbFhaI1L9dIPzEhuFsu+?=
 =?us-ascii?Q?48B+okr14DXyUK8wSLngKVF/Rw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OH7pjgG4v90CywNuAsJ0vYsEcOtp7SFX1ey57vvFElf1XHFQl10oQKELWmKg?=
 =?us-ascii?Q?FkHwOwb1/9NenLzdb/Qm/uL0sYwrGzIvJ8B0AHulCct+1ffYENAVq+e5hzq1?=
 =?us-ascii?Q?6IWOwcFRu4xPjRhuUIk9MsHsCzP7lrp4Agd4bHJzSEt7nj6gNa+ZGKcxgJnm?=
 =?us-ascii?Q?lPa0Fs4iJg5T2vx3N/kosyxDu8sG/+t41ykWPqSgGWTlU2WjU8FprVK5nDeU?=
 =?us-ascii?Q?6AdzSChdtRe8gzv21GAKtpsdNz7SZC1pVUGxwk3b/hnW75sfUCMdcJAQ6W7M?=
 =?us-ascii?Q?y9dX8WVbsi1RbH1XdpMkNVFVzuzqUCwsjH0gglQAmreND54Ogar8Fpw1qTsR?=
 =?us-ascii?Q?yGPi9jsCentDMMeBWgiU6y29Y6hxgobK21QQZxpgtkE++alNmbPyjFDd/UFL?=
 =?us-ascii?Q?hjPQpU7KuqSBw4joCSgF4m9pyo+lEL/HG2g1bceydVp+O22wyJ9lLiY++TUG?=
 =?us-ascii?Q?7DiaiBi6+hpZcZpj/e/TdmnEA6AkRpD4s4ZJ6bI1r8ERl25AmW7zQtdAbg5q?=
 =?us-ascii?Q?lSN6+JzMetTUCkr4g5/8jHRUo5gv+MFt24SAoWuHk8+zB7kcJ28Eo8V3V7Co?=
 =?us-ascii?Q?RPFqUVz3bT/pj0Zkmk+H2bf3xAxd2gQeP6WBkDNRu3QGn9p1KcJKWqZtdkri?=
 =?us-ascii?Q?jZAkKIAROIRbWM1jr/UwrXbKcCnzmmFhVSup5O9wNnjnkxJuTWBBcQq+f3c2?=
 =?us-ascii?Q?wQqkkejYvVvg0tAZWG2bH8Jtym/+5JX9R57WL0dpzqFAGWLm+LwNasD6JwGg?=
 =?us-ascii?Q?MbToK1GND6bgpa2cGELfnAvhoecYNSzMt2IckQQfgx6Zsms5wGi9zKstCcWb?=
 =?us-ascii?Q?ZsJuAdC+zjC7cQarLKnpxGiG8zrkgoGj/2aFmd58f+QHWtuEXTeIJHQ0i16x?=
 =?us-ascii?Q?jFm8rJZj+0rrSCQNETYN3mwAVMNbtG0BY6wEkzrU7qFHWy+1LkRtRzneMVkT?=
 =?us-ascii?Q?nWq5cbq9QKStXpKloFCqZrdcmaVzx8AuM2Yv0rhsFSJoQ80eoKp67tTK5LeS?=
 =?us-ascii?Q?V5OJcd0MPZicDRH7HzRJ31EekBPsbD7hehsoDhlmnj8KnUf7qrNIQVA0tr9S?=
 =?us-ascii?Q?QSrWjKk5mZzImqwdgwKh67bh59BtDoy3lh46QcmDDiakzSwoOwWAm46eoqVT?=
 =?us-ascii?Q?WxA2q9ml1KNLUr++WLBeN/jctyYBFPfsoPWJQI84fqt5+dMTBGNTbrDhbaR3?=
 =?us-ascii?Q?rOLRZcu6IGRrC8hrNekKXFsp1athe/jl6OWY7gxINsKtF1N5Vt8mgCJVnM/E?=
 =?us-ascii?Q?5KeScgs651ggaewjEQD6esEDCC7krT1wsTs3+ItpQKhG6mnJUW98sB6xxxpE?=
 =?us-ascii?Q?JBYyc6++K0hGudOxYOt8/R6aSLAhO9+J1moKmnOMyZkI8phryRzAji58Wo9b?=
 =?us-ascii?Q?TvgmNigsxOPFq11zHs+1ZnSXMj0w8FYEroJgTS0/U3Iv8ExFYzV4DqVove/e?=
 =?us-ascii?Q?A3bhgalzJi9fkc+SzwTfOofS5hrg++FCTV0LNE7/HhBQ4F8RBPSDOg=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-da224.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 337d24b2-85b6-4cfa-076a-08deff3a7d39
X-MS-Exchange-CrossTenant-AuthSource: CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 04:13:01.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP8P284MB2735

Fix several coding style issues in ethernet.c, including line wrapping,
continuation alignment and function declaration formatting.

No functional changes intended.

Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
---
 drivers/staging/octeon/ethernet.c | 308 +++++++++++++++---------------
 1 file changed, 157 insertions(+), 151 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..4557893bbba4 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -32,55 +32,61 @@
 
 static int num_packet_buffers = 1024;
 module_param(num_packet_buffers, int, 0444);
-MODULE_PARM_DESC(num_packet_buffers, "\n"
-	"\tNumber of packet buffers to allocate and store in the\n"
-	"\tFPA. By default, 1024 packet buffers are used.\n");
+MODULE_PARM_DESC(num_packet_buffers,
+		 "\n"
+		 "\tNumber of packet buffers to allocate and store in the\n"
+		 "\tFPA. By default, 1024 packet buffers are used.\n");
 
 static int pow_receive_group = 15;
 module_param(pow_receive_group, int, 0444);
-MODULE_PARM_DESC(pow_receive_group, "\n"
-	"\tPOW group to receive packets from. All ethernet hardware\n"
-	"\twill be configured to send incoming packets to this POW\n"
-	"\tgroup. Also any other software can submit packets to this\n"
-	"\tgroup for the kernel to process.");
+MODULE_PARM_DESC(pow_receive_group,
+		 "\n"
+		 "\tPOW group to receive packets from. All ethernet hardware\n"
+		 "\twill be configured to send incoming packets to this POW\n"
+		 "\tgroup. Also any other software can submit packets to this\n"
+		 "\tgroup for the kernel to process.");
 
 static int receive_group_order;
 module_param(receive_group_order, int, 0444);
-MODULE_PARM_DESC(receive_group_order, "\n"
-	"\tOrder (0..4) of receive groups to take into use. Ethernet hardware\n"
-	"\twill be configured to send incoming packets to multiple POW\n"
-	"\tgroups. pow_receive_group parameter is ignored when multiple\n"
-	"\tgroups are taken into use and groups are allocated starting\n"
-	"\tfrom 0. By default, a single group is used.\n");
+MODULE_PARM_DESC(receive_group_order,
+		 "\n"
+		 "\tOrder (0..4) of receive groups to take into use. Ethernet hardware\n"
+		 "\twill be configured to send incoming packets to multiple POW\n"
+		 "\tgroups. pow_receive_group parameter is ignored when multiple\n"
+		 "\tgroups are taken into use and groups are allocated starting\n"
+		 "\tfrom 0. By default, a single group is used.\n");
 
 int pow_send_group = -1;
 module_param(pow_send_group, int, 0644);
-MODULE_PARM_DESC(pow_send_group, "\n"
-	"\tPOW group to send packets to other software on. This\n"
-	"\tcontrols the creation of the virtual device pow0.\n"
-	"\talways_use_pow also depends on this value.");
+MODULE_PARM_DESC(pow_send_group,
+		 "\n"
+		 "\tPOW group to send packets to other software on. This\n"
+		 "\tcontrols the creation of the virtual device pow0.\n"
+		 "\talways_use_pow also depends on this value.");
 
 int always_use_pow;
 module_param(always_use_pow, int, 0444);
-MODULE_PARM_DESC(always_use_pow, "\n"
-	"\tWhen set, always send to the pow group. This will cause\n"
-	"\tpackets sent to real ethernet devices to be sent to the\n"
-	"\tPOW group instead of the hardware. Unless some other\n"
-	"\tapplication changes the config, packets will still be\n"
-	"\treceived from the low level hardware. Use this option\n"
-	"\tto allow a CVMX app to intercept all packets from the\n"
-	"\tlinux kernel. You must specify pow_send_group along with\n"
-	"\tthis option.");
+MODULE_PARM_DESC(always_use_pow,
+		 "\n"
+		 "\tWhen set, always send to the pow group. This will cause\n"
+		 "\tpackets sent to real ethernet devices to be sent to the\n"
+		 "\tPOW group instead of the hardware. Unless some other\n"
+		 "\tapplication changes the config, packets will still be\n"
+		 "\treceived from the low level hardware. Use this option\n"
+		 "\tto allow a CVMX app to intercept all packets from the\n"
+		 "\tlinux kernel. You must specify pow_send_group along with\n"
+		 "\tthis option.");
 
 char pow_send_list[128] = "";
 module_param_string(pow_send_list, pow_send_list, sizeof(pow_send_list), 0444);
-MODULE_PARM_DESC(pow_send_list, "\n"
-	"\tComma separated list of ethernet devices that should use the\n"
-	"\tPOW for transmit instead of the actual ethernet hardware. This\n"
-	"\tis a per port version of always_use_pow. always_use_pow takes\n"
-	"\tprecedence over this list. For example, setting this to\n"
-	"\t\"eth2,spi3,spi7\" would cause these three devices to transmit\n"
-	"\tusing the pow_send_group.");
+MODULE_PARM_DESC(pow_send_list,
+		 "\n"
+		 "\tComma separated list of ethernet devices that should use the\n"
+		 "\tPOW for transmit instead of the actual ethernet hardware. This\n"
+		 "\tis a per port version of always_use_pow. always_use_pow takes\n"
+		 "\tprecedence over this list. For example, setting this to\n"
+		 "\t\"eth2,spi3,spi7\" would cause these three devices to transmit\n"
+		 "\tusing the pow_send_group.");
 
 int rx_napi_weight = 32;
 module_param(rx_napi_weight, int, 0444);
@@ -122,7 +128,8 @@ static void cvm_oct_remove_device(int port)
 static void cvm_oct_rx_refill_worker(struct work_struct *work)
 {
 	struct octeon_ethernet_platform *plat = container_of(work,
-		struct octeon_ethernet_platform, rx_refill_work.work);
+							     struct octeon_ethernet_platform,
+							     rx_refill_work.work);
 	/*
 	 * FPA 0 may have been drained, try to refill it if we need
 	 * more than num_packet_buffers / 2, otherwise normal receive
@@ -145,8 +152,7 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
 	if (priv->poll)
 		priv->poll(cvm_oct_device[priv->port]);
 
-	cvm_oct_device[priv->port]->netdev_ops->ndo_get_stats
-						(cvm_oct_device[priv->port]);
+	cvm_oct_device[priv->port]->netdev_ops->ndo_get_stats(cvm_oct_device[priv->port]);
 
 	if (!atomic_read(&cvm_oct_poll_queue_stopping))
 		schedule_delayed_work(&priv->port_periodic_work, HZ);
@@ -156,8 +162,8 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 {
 	/* Setup the FPA */
 	cvmx_fpa_enable();
-	cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
-			     num_packet_buffers);
+	cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_PACKET_POOL,
+			     CVMX_FPA_PACKET_POOL_SIZE, num_packet_buffers);
 	cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
@@ -193,8 +199,8 @@ int cvm_oct_free_work(void *work_queue_entry)
 	union cvmx_buf_ptr segment_ptr = work->packet_ptr;
 
 	while (segments--) {
-		union cvmx_buf_ptr next_ptr = *(union cvmx_buf_ptr *)
-			cvmx_phys_to_ptr(segment_ptr.s.addr - 8);
+		union cvmx_buf_ptr next_ptr =
+			*(union cvmx_buf_ptr *)cvmx_phys_to_ptr(segment_ptr.s.addr - 8);
 		if (unlikely(!segment_ptr.s.i))
 			cvmx_fpa_free(cvm_oct_get_buffer_ptr(segment_ptr),
 				      segment_ptr.s.pool,
@@ -262,9 +268,8 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 
 	dev->mtu = new_mtu;
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 && cvmx_helper_interface_get_mode(interface) !=
+				     CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int index = INDEX(priv->port);
 		/* Add ethernet header and FCS, and VLAN if configured. */
 		int max_packet = new_mtu + mtu_overhead;
@@ -308,14 +313,13 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 && cvmx_helper_interface_get_mode(interface) !=
+				CVMX_HELPER_INTERFACE_MODE_SPI) {
 		union cvmx_gmxx_rxx_adr_ctl control;
 		int index = INDEX(priv->port);
 
 		control.u64 = 0;
-		control.s.bcst = 1;	/* Allow broadcast MAC addresses */
+		control.s.bcst = 1; /* Allow broadcast MAC addresses */
 
 		if (!netdev_mc_empty(dev) || (dev->flags & IFF_ALLMULTI) ||
 		    (dev->flags & IFF_PROMISC))
@@ -336,18 +340,16 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)
 			control.s.cam_mode = 1;
 
 		gmx_cfg.u64 =
-		    cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
+			cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
 		cvmx_write_csr(CVMX_GMXX_PRTX_CFG(index, interface),
 			       gmx_cfg.u64 & ~1ull);
 
 		cvmx_write_csr(CVMX_GMXX_RXX_ADR_CTL(index, interface),
 			       control.u64);
 		if (dev->flags & IFF_PROMISC)
-			cvmx_write_csr(CVMX_GMXX_RXX_ADR_CAM_EN
-				       (index, interface), 0);
+			cvmx_write_csr(CVMX_GMXX_RXX_ADR_CAM_EN(index, interface), 0);
 		else
-			cvmx_write_csr(CVMX_GMXX_RXX_ADR_CAM_EN
-				       (index, interface), 1);
+			cvmx_write_csr(CVMX_GMXX_RXX_ADR_CAM_EN(index, interface), 1);
 
 		cvmx_write_csr(CVMX_GMXX_PRTX_CFG(index, interface),
 			       gmx_cfg.u64);
@@ -360,9 +362,8 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 && cvmx_helper_interface_get_mode(interface) !=
+				CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int i;
 		const u8 *ptr = dev->dev_addr;
 		u64 mac = 0;
@@ -372,7 +373,7 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 			mac = (mac << 8) | (u64)ptr[i];
 
 		gmx_cfg.u64 =
-		    cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
+			cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
 		cvmx_write_csr(CVMX_GMXX_PRTX_CFG(index, interface),
 			       gmx_cfg.u64 & ~1ull);
 
@@ -533,96 +534,96 @@ static int cvm_oct_xaui_open(struct net_device *dev)
 }
 
 static const struct net_device_ops cvm_oct_npi_netdev_ops = {
-	.ndo_init		= cvm_oct_common_init,
-	.ndo_uninit		= cvm_oct_common_uninit,
-	.ndo_start_xmit		= cvm_oct_xmit,
-	.ndo_set_rx_mode	= cvm_oct_common_set_multicast_list,
-	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
-	.ndo_eth_ioctl		= cvm_oct_ioctl,
-	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_init = cvm_oct_common_init,
+	.ndo_uninit = cvm_oct_common_uninit,
+	.ndo_start_xmit = cvm_oct_xmit,
+	.ndo_set_rx_mode = cvm_oct_common_set_multicast_list,
+	.ndo_set_mac_address = cvm_oct_common_set_mac_address,
+	.ndo_eth_ioctl = cvm_oct_ioctl,
+	.ndo_change_mtu = cvm_oct_common_change_mtu,
+	.ndo_get_stats = cvm_oct_common_get_stats,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= cvm_oct_poll_controller,
+	.ndo_poll_controller = cvm_oct_poll_controller,
 #endif
 };
 
 static const struct net_device_ops cvm_oct_xaui_netdev_ops = {
-	.ndo_init		= cvm_oct_common_init,
-	.ndo_uninit		= cvm_oct_common_uninit,
-	.ndo_open		= cvm_oct_xaui_open,
-	.ndo_stop		= cvm_oct_common_stop,
-	.ndo_start_xmit		= cvm_oct_xmit,
-	.ndo_set_rx_mode	= cvm_oct_common_set_multicast_list,
-	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
-	.ndo_eth_ioctl		= cvm_oct_ioctl,
-	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_init = cvm_oct_common_init,
+	.ndo_uninit = cvm_oct_common_uninit,
+	.ndo_open = cvm_oct_xaui_open,
+	.ndo_stop = cvm_oct_common_stop,
+	.ndo_start_xmit = cvm_oct_xmit,
+	.ndo_set_rx_mode = cvm_oct_common_set_multicast_list,
+	.ndo_set_mac_address = cvm_oct_common_set_mac_address,
+	.ndo_eth_ioctl = cvm_oct_ioctl,
+	.ndo_change_mtu = cvm_oct_common_change_mtu,
+	.ndo_get_stats = cvm_oct_common_get_stats,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= cvm_oct_poll_controller,
+	.ndo_poll_controller = cvm_oct_poll_controller,
 #endif
 };
 
 static const struct net_device_ops cvm_oct_sgmii_netdev_ops = {
-	.ndo_init		= cvm_oct_sgmii_init,
-	.ndo_uninit		= cvm_oct_common_uninit,
-	.ndo_open		= cvm_oct_sgmii_open,
-	.ndo_stop		= cvm_oct_common_stop,
-	.ndo_start_xmit		= cvm_oct_xmit,
-	.ndo_set_rx_mode	= cvm_oct_common_set_multicast_list,
-	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
-	.ndo_eth_ioctl		= cvm_oct_ioctl,
-	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_init = cvm_oct_sgmii_init,
+	.ndo_uninit = cvm_oct_common_uninit,
+	.ndo_open = cvm_oct_sgmii_open,
+	.ndo_stop = cvm_oct_common_stop,
+	.ndo_start_xmit = cvm_oct_xmit,
+	.ndo_set_rx_mode = cvm_oct_common_set_multicast_list,
+	.ndo_set_mac_address = cvm_oct_common_set_mac_address,
+	.ndo_eth_ioctl = cvm_oct_ioctl,
+	.ndo_change_mtu = cvm_oct_common_change_mtu,
+	.ndo_get_stats = cvm_oct_common_get_stats,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= cvm_oct_poll_controller,
+	.ndo_poll_controller = cvm_oct_poll_controller,
 #endif
 };
 
 static const struct net_device_ops cvm_oct_spi_netdev_ops = {
-	.ndo_init		= cvm_oct_spi_init,
-	.ndo_uninit		= cvm_oct_spi_uninit,
-	.ndo_start_xmit		= cvm_oct_xmit,
-	.ndo_set_rx_mode	= cvm_oct_common_set_multicast_list,
-	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
-	.ndo_eth_ioctl		= cvm_oct_ioctl,
-	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_init = cvm_oct_spi_init,
+	.ndo_uninit = cvm_oct_spi_uninit,
+	.ndo_start_xmit = cvm_oct_xmit,
+	.ndo_set_rx_mode = cvm_oct_common_set_multicast_list,
+	.ndo_set_mac_address = cvm_oct_common_set_mac_address,
+	.ndo_eth_ioctl = cvm_oct_ioctl,
+	.ndo_change_mtu = cvm_oct_common_change_mtu,
+	.ndo_get_stats = cvm_oct_common_get_stats,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= cvm_oct_poll_controller,
+	.ndo_poll_controller = cvm_oct_poll_controller,
 #endif
 };
 
 static const struct net_device_ops cvm_oct_rgmii_netdev_ops = {
-	.ndo_init		= cvm_oct_common_init,
-	.ndo_uninit		= cvm_oct_common_uninit,
-	.ndo_open		= cvm_oct_rgmii_open,
-	.ndo_stop		= cvm_oct_common_stop,
-	.ndo_start_xmit		= cvm_oct_xmit,
-	.ndo_set_rx_mode	= cvm_oct_common_set_multicast_list,
-	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
-	.ndo_eth_ioctl		= cvm_oct_ioctl,
-	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_init = cvm_oct_common_init,
+	.ndo_uninit = cvm_oct_common_uninit,
+	.ndo_open = cvm_oct_rgmii_open,
+	.ndo_stop = cvm_oct_common_stop,
+	.ndo_start_xmit = cvm_oct_xmit,
+	.ndo_set_rx_mode = cvm_oct_common_set_multicast_list,
+	.ndo_set_mac_address = cvm_oct_common_set_mac_address,
+	.ndo_eth_ioctl = cvm_oct_ioctl,
+	.ndo_change_mtu = cvm_oct_common_change_mtu,
+	.ndo_get_stats = cvm_oct_common_get_stats,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= cvm_oct_poll_controller,
+	.ndo_poll_controller = cvm_oct_poll_controller,
 #endif
 };
 
 static const struct net_device_ops cvm_oct_pow_netdev_ops = {
-	.ndo_init		= cvm_oct_common_init,
-	.ndo_start_xmit		= cvm_oct_xmit_pow,
-	.ndo_set_rx_mode	= cvm_oct_common_set_multicast_list,
-	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
-	.ndo_eth_ioctl		= cvm_oct_ioctl,
-	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_init = cvm_oct_common_init,
+	.ndo_start_xmit = cvm_oct_xmit_pow,
+	.ndo_set_rx_mode = cvm_oct_common_set_multicast_list,
+	.ndo_set_mac_address = cvm_oct_common_set_mac_address,
+	.ndo_eth_ioctl = cvm_oct_ioctl,
+	.ndo_change_mtu = cvm_oct_common_change_mtu,
+	.ndo_get_stats = cvm_oct_common_get_stats,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= cvm_oct_poll_controller,
+	.ndo_poll_controller = cvm_oct_poll_controller,
 #endif
 };
 
-static struct device_node *cvm_oct_of_get_child
-				(const struct device_node *parent, int reg_val)
+static struct device_node *
+cvm_oct_of_get_child(const struct device_node *parent, int reg_val)
 {
 	struct device_node *node;
 	const __be32 *addr;
@@ -737,7 +738,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			union cvmx_pip_prt_tagx pip_prt_tagx;
 
 			pip_prt_tagx.u64 =
-			    cvmx_read_csr(CVMX_PIP_PRT_TAGX(port));
+				cvmx_read_csr(CVMX_PIP_PRT_TAGX(port));
 
 			if (receive_group_order) {
 				int tag_mask;
@@ -750,23 +751,23 @@ static int cvm_oct_probe(struct platform_device *pdev)
 					pip_prt_tagx.u64 |= 0x3ull << 44;
 
 				tag_mask = ~((1 << receive_group_order) - 1);
-				pip_prt_tagx.s.grptagbase	= 0;
-				pip_prt_tagx.s.grptagmask	= tag_mask;
-				pip_prt_tagx.s.grptag		= 1;
-				pip_prt_tagx.s.tag_mode		= 0;
-				pip_prt_tagx.s.inc_prt_flag	= 1;
-				pip_prt_tagx.s.ip6_dprt_flag	= 1;
-				pip_prt_tagx.s.ip4_dprt_flag	= 1;
-				pip_prt_tagx.s.ip6_sprt_flag	= 1;
-				pip_prt_tagx.s.ip4_sprt_flag	= 1;
-				pip_prt_tagx.s.ip6_dst_flag	= 1;
-				pip_prt_tagx.s.ip4_dst_flag	= 1;
-				pip_prt_tagx.s.ip6_src_flag	= 1;
-				pip_prt_tagx.s.ip4_src_flag	= 1;
-				pip_prt_tagx.s.grp		= 0;
+				pip_prt_tagx.s.grptagbase = 0;
+				pip_prt_tagx.s.grptagmask = tag_mask;
+				pip_prt_tagx.s.grptag = 1;
+				pip_prt_tagx.s.tag_mode = 0;
+				pip_prt_tagx.s.inc_prt_flag = 1;
+				pip_prt_tagx.s.ip6_dprt_flag = 1;
+				pip_prt_tagx.s.ip4_dprt_flag = 1;
+				pip_prt_tagx.s.ip6_sprt_flag = 1;
+				pip_prt_tagx.s.ip4_sprt_flag = 1;
+				pip_prt_tagx.s.ip6_dst_flag = 1;
+				pip_prt_tagx.s.ip4_dst_flag = 1;
+				pip_prt_tagx.s.ip6_src_flag = 1;
+				pip_prt_tagx.s.ip4_src_flag = 1;
+				pip_prt_tagx.s.grp = 0;
 			} else {
-				pip_prt_tagx.s.grptag	= 0;
-				pip_prt_tagx.s.grp	= pow_receive_group;
+				pip_prt_tagx.s.grptag = 0;
+				pip_prt_tagx.s.grp = pow_receive_group;
 			}
 
 			cvmx_write_csr(CVMX_PIP_PRT_TAGX(port),
@@ -807,23 +808,25 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
 
 			if (register_netdev(dev) < 0) {
-				netdev_err(dev, "Failed to register ethernet device for POW\n");
+				netdev_err(dev,
+					   "Failed to register ethernet device for POW\n");
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
-				netdev_info(dev, "POW send group %d, receive group %d\n",
-					    pow_send_group,
-					    pow_receive_group);
+				netdev_info(dev,
+					    "POW send group %d, receive group %d\n",
+					    pow_send_group, pow_receive_group);
 			}
 		} else {
-			dev_err(&pdev->dev, "Failed to allocate ethernet device for POW\n");
+			dev_err(&pdev->dev,
+				"Failed to allocate ethernet device for POW\n");
 		}
 	}
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
 		enum cvmx_helper_interface_mode imode =
-		    cvmx_helper_interface_get_mode(interface);
+			cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
 		int port_index;
@@ -834,9 +837,10 @@ static int cvm_oct_probe(struct platform_device *pdev)
 		     port_index++, port++) {
 			struct octeon_ethernet *priv;
 			struct net_device *dev =
-			    alloc_etherdev(sizeof(struct octeon_ethernet));
+				alloc_etherdev(sizeof(struct octeon_ethernet));
 			if (!dev) {
-				dev_err(&pdev->dev, "Failed to allocate ethernet device for port %d\n",
+				dev_err(&pdev->dev,
+					"Failed to allocate ethernet device for port %d\n",
 					port);
 				continue;
 			}
@@ -910,9 +914,11 @@ static int cvm_oct_probe(struct platform_device *pdev)
 				break;
 			}
 
-			if (priv->of_node && of_phy_is_fixed_link(priv->of_node)) {
+			if (priv->of_node &&
+			    of_phy_is_fixed_link(priv->of_node)) {
 				if (of_phy_register_fixed_link(priv->of_node)) {
-					netdev_err(dev, "Failed to register fixed link for interface %d, port %d\n",
+					netdev_err(dev,
+						   "Failed to register fixed link for interface %d, port %d\n",
 						   interface, priv->port);
 					dev->netdev_ops = NULL;
 				}
@@ -921,14 +927,14 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			if (!dev->netdev_ops) {
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
-				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
+				netdev_err(dev,
+					   "Failed to register ethernet device for interface %d, port %d\n",
 					   interface, priv->port);
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;
-				fau -=
-				    cvmx_pko_get_num_queues(priv->port) *
-				    sizeof(u32);
+				fau -= cvmx_pko_get_num_queues(priv->port) *
+				       sizeof(u32);
 				schedule_delayed_work(&priv->port_periodic_work,
 						      HZ);
 			}
@@ -1003,8 +1009,8 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	cvmx_ipd_free_ptr();
 
 	/* Free the HW pools */
-	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
-			      num_packet_buffers);
+	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_PACKET_POOL,
+			      CVMX_FPA_PACKET_POOL_SIZE, num_packet_buffers);
 	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
-- 
2.55.0

