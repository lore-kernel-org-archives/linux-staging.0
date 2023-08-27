Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2014.outbound.protection.outlook.com [40.92.22.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D854814A8A
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 23:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg8JS91i9yxiI27SLQUDNLd7NQ3F8YXOcXY4p/yDgyp/Ta5+rC1h60Du8kwcTL7gEi0QTCOVwd2lMa//+Q5fCiYZnMZGAuSVuNnSJmWhyYjUVAKrePsOru+GTMquyVfEzG+9q6wpkd9wFoFsqqesqSlrJZBt+y7+U7vQxbrxgKbc2ZlILdQ7VnJzMv/Vct3qUfq4UnEJkCWgMWhP1USFEYm2rHXT9/AUyooFTEMVF4SvjW+o7Q+/MMcHdr+FvgHatVD9Up+2QC/Z28lHw3dbsqjlisv+AfA4+xrLiyM3+D1+rsisaDKNzrH8DV/UnwpxEt9Tn4YB1sYEuYXDhvLPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya8Ox1pYXqokkEgtHIqwPbda2uP7V1m9pN/PEO/Jk3M=;
 b=m3qckQJ8h+UoFq+w+gUcfXAiZpTjdCP7zu3kYnrnqIOxcWJTqSbWRgsEnN/yAezlJ8fgZm/SB3QPq6daJVnccRKvgHzVJcWnVkfVO1s/Z0txbscdnaC+y7/UDNxuTOSmWp8VcPE6w5bgosYXm8coj0uXdOK8UlDfI1TJ3spvwLZZT2HySz0Qr0gR5QdD40pEqTs8HRMYq3JkLhhZK7CcSZIMAqw5QPSWFrMcaUJcIoJkkuN4J68y9azw+5w1yDf9cH9ZmukcJ5F+cTcTGpeu0Gy0KN0IzkzfaAmTgsYelZH8ckFc4gAI3gPLVIiad1eA///8E5VYNimaOAzCe2cwZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya8Ox1pYXqokkEgtHIqwPbda2uP7V1m9pN/PEO/Jk3M=;
 b=DZxhRWkV6eNastFhwpP8rCnfvWcoT4Ix5DFP5P5iQ5W007hiA5jHjziTc+E6Rj5SaZQzOAhdT8pO4xs3V8uzDFFhC/ii1030WJyRPzCJM9gRiWnOtEL0eHWyMdxoVAnWn0nIPywpeVDRv4hhy+gTZUTZbABiy0jRFz0xQaWwqxJHybN7pPffCaCjUAfMl/wxRHcx0XtJiCE8c3tNSkrzdPlqvzq+If4aLBZXzhVj2xA2Jl864IuSuRJPwMtH2pA40MetxOOPvbQ+q3mONdHm7A08viWxEgp/fsKLBpER3EoocrACA3pxZ4V4OPCUCEwyl4/vS4fO0Q5+zNkr25GJug==
Received: from PH7PR11MB7643.namprd11.prod.outlook.com (2603:10b6:510:27c::22)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sun, 27 Aug
 2023 23:58:51 +0000
Received: from PH7PR11MB7643.namprd11.prod.outlook.com
 ([fe80::bfb7:d3a3:2ed:6e20]) by PH7PR11MB7643.namprd11.prod.outlook.com
 ([fe80::bfb7:d3a3:2ed:6e20%7]) with mapi id 15.20.6699.034; Sun, 27 Aug 2023
 23:58:51 +0000
From: Oliver Crumrine <ozlinux@hotmail.com>
To: gregkh@linuxfoundation.org,
	colin.i.king@gmail.com,
	sumitraartsy@gmail.com,
	u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org
Cc: Oliver Crumrine <ozlinux@hotmail.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 6/6] staging: octeon: clean up the octeon ethernet driver
Date: Sun, 27 Aug 2023 19:58:22 -0400
Message-ID:
 <PH7PR11MB764329EC8CFB56ABFA7A8D77BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693180346.git.ozlinux@hotmail.com>
References: <cover.1693180346.git.ozlinux@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [z2XZ42n7XlqLmD9DEzNQPv9sNQCIxakh9z0n1OBOQ9XS7yUKU3fhQ6wW1H+rPsYp]
X-ClientProxiedBy: BL1PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:208:2be::31) To PH7PR11MB7643.namprd11.prod.outlook.com
 (2603:10b6:510:27c::22)
X-Microsoft-Original-Message-ID:
 <34d9faca22425cdccdaabbfaed140342a1ed550a.1693180346.git.ozlinux@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7643:EE_|BN9PR11MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f07085-f103-45f8-cf39-08dba7598fc2
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9XmrTVQo2E8YhiYZbimk9QHlfee0RmoCxeVIXDMPaqIiG9IknEzJ/Hs2j908RA3MUEPMeaKBMVSZCSdnQTumLw47IvpK32nkAKMpLTmV6so6E0WlEEELgpsYofo2egGJMrkXn7GnlVSa4cdnLPCLAyjP+tAUi5LxOPXj2qhABhx0WfT4vNBt73mWz6eLze2Hz6PfiuLVayeWvi3n3e06dm4hqbDzel4NAxRwbEBHEiZXKa9mSxsLnAJKBZZMGoSyZPFRq2BoYntt1G9K2IOgojUbY8IIcDcsKNRZanJ3rGTQcJxoC9Rcd/qaVsvg8SXVS/JZ0SBVd2S5AEpAHYBwMKG1Fv7JCyz3MKdLx9GHkvuh1b7iEWKUeASal6UbNQLTzsWPoXsIayeWEX+u7/ex/BpDpti9moEYvvfeViSUV1Pli3s4i+sC8tFxK0mbFTuJm1YjYBTvtqscX6SR1c7S2GzL6k42Mt0/Ztg6YS9EH/+v+FXu9FJbi8QvViNxBFyaU6KBYXogrsLikZVYykmAzySiNEiJCm4a/49Pl1DUWgUUuDrM0KsxuzAvv6mo9buNLcpNEJDR5auVFE9O+pq+Qf7boUjx8WoS01DbKA6FKLIFkmw+Nv5Fatk1lD6HJ68ALmOWk4HhHEhaBIuYuRQZOHcgFiNeZ9H23DiyE6IxXZUne3zXmkos7odql9KXCji/VEzcc9WWy/7D7OCOaQPmH7Ay+3PXJdO4ovIRYzjN4mnSbUrxgqgkGb6xuMiyY+gy7GIA=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wvDYpp5U3yhEUOy5dGIsOWTB6veXEEsL9nEdLf84g0YENe5ZbgxJU4CvnGjxxeQ+SiZ/ZIZpEr1wgvdAJc37G+KJ5tS9A0ivN7hi0AiVtrlHM8WfAc0vjsriXvDf3DU2q+WRQNOUtUrZPK5tXpIqVEXXO0GcKx2NTINbP5C92rzAPc/RJfS9awurHrYKsZjF+etl2kzdjaJm9bOQJ3LI2Pz7aWdK1siCwcuZydU++Ri/P//+E08C7fx0SkAAjIFGv0iAIyWQxrJLAyxybSTq3mr/by2iXvBWE2Te5FP2UbVmIOB8NwmHGYhaSb89KYtgBHsnfILCYGJdZiNDpo738eIXlbgcvPjX1/WA/eV1JNc1Gbi+jUfMKgUBMub+v16szESDe9fVLdVBae7zlQ5XVcIbRbhaXa3zMgoOwLVs6uO56xRXf8WLHk1EZr3qBYjxWbayR8969rldOG2CFgL+a4HL2nX8k4HQFbVTjDNNPVq1cW1spTm81KoeW0yANydR9WnjmOXbVfqE47vbBdC3SqnKgy6aBckwXm0ttPPZ/tDq0dC/dem+FPW1sHw4dpRnArzBtG3eEr95epFOp/bSK/poSMioqu5pC6i63czLULXAgQz+B2Rf7BihpChM66hG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d1Hoz96A2yxk83GuzucdQVy16/wQe9d7rBZ2skS7ntY9g91c1xmh7rmjBukT?=
 =?us-ascii?Q?jhCzWeVC03oT36qyRQWKRpk7iqRdoc1TnR4Lcc/Vf38CKYcRHTprUiVsqf1l?=
 =?us-ascii?Q?f9K3MrPuCkmMjKM0RPS/corOEpJwciJ2khJA1FpxIPQgf6BTAuRllYqYYagd?=
 =?us-ascii?Q?KvJOgnmOdo8wkVfWFBL6yJH0Tx5fismJDkZRJCEpUVXmt8pgDcnSxrMC9Kfv?=
 =?us-ascii?Q?jbo95w02Sa3Y5Ze1zrkX9LyCbfRqCjuCjr9/pb/nVJ0rLag7XWGs0l7DJ1vj?=
 =?us-ascii?Q?WHOoxUpqdgPMTLU1mMdwRbU565MNPG1LLfTGkfksr36sTmPkwiEC0ztThUj/?=
 =?us-ascii?Q?NH3oTjEa+QeqYrz4pil1rKTkJtJJtCkzBgPAuQ+mHi6z6Qdpl8e6mCemWhPT?=
 =?us-ascii?Q?vMzdS9iqyRFrsuQIOr2DsH3VV3HjFQsyu1kLwRnhupesULjkFaKSZB6glNrb?=
 =?us-ascii?Q?22FFGW/ByznIN/HgyIdM2NDmliTZujFPDSpMhL/Z2IHMlqnkUJLWJwpu2XCS?=
 =?us-ascii?Q?O2sqbTkUAj5xK3BKuCSNz4pyaawg/yVK54JqkKr0jtRQiKwRkGIXTikUOpza?=
 =?us-ascii?Q?T0TE9obUlYxxkO7N+lsvKHQ4vcu/oXQev6Ix7JbI1HPoUfzZthjcKDa2EhMR?=
 =?us-ascii?Q?LLmYuBpoCtAJGGsunysfaZqkmkVQ8SOKm+BOJ2xKwoPSPth9SScXP226CedH?=
 =?us-ascii?Q?+ZfHubEweYZKEmcp3asjYBnYkzUb+bPMXWR/lf46kHdplmgHr6EFuaNBMxVq?=
 =?us-ascii?Q?4jO7MbgCKCJ1a98fSV1lwaUVlwySfxWJu3lbAZ0cg6xcfdC2pbduxXdsd6LP?=
 =?us-ascii?Q?tgQr/KmiBxXUX3oyWQvUfS6aArUNlhvs/yi9FFnvGWE1AN0OmkRIZLM5ijTc?=
 =?us-ascii?Q?p8NJID0pGkf2lnieSIJQIbirQIKlZeHp4/CJEymdf+Josnlpyq8USfzfZNTv?=
 =?us-ascii?Q?5ShwXcDcxGdaDnNgOOg7rDpAj7/CkO1OC1BFOz89lgaLIFi9xe+ligmJsfIu?=
 =?us-ascii?Q?hE4xzwIWzECz5X3fsVr/FJlRgETpdbRKGQgl5VkYCGatV2TrB2Jfu7Ydbcn4?=
 =?us-ascii?Q?fj6foh6WpHLh2QdPSMBQ81z5N2rIN2jdLiR3QagC3R7ZD70d9e8g5uSSEt7t?=
 =?us-ascii?Q?3TAUxnrM+867hE3sILK6Ihv39Gnmm87lWC3dy6FzoohVacm8CK5piSdt3GUH?=
 =?us-ascii?Q?SGZneTSxkV2dttHsnwRR/jHrgRboZpenu5drEVyBrsBauN+ZUtV0E4bghG4g?=
 =?us-ascii?Q?aaZOdQ+NNbFGTjHMxxCGm3KCj1vhERnlf2ITZ/m9QQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e8f36.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f07085-f103-45f8-cf39-08dba7598fc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7643.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2023 23:58:51.1635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306

Make the octeon ethernet driver better adhere to the
kernel coding standard

Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
---
v2: Actually send the patch set properly 
v3: Fixed a problem where I forgot to rename all instances of a struct

 drivers/staging/octeon/ethernet.c     | 2 +-
 drivers/staging/octeon/octeon-stubs.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 023b107e077a..f01cdfa3275a 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,7 +201,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
+	struct cvmx_pip_port_status_t rx_status;
 	cvmx_pko_port_status_t tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index b9852994882b..8befdcee6ee9 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -384,7 +384,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	uint32_t dropped_octets;
 	uint32_t dropped_packets;
 	uint32_t pci_raw_packets;
@@ -407,7 +407,7 @@ typedef struct {
 	uint32_t inb_packets;
 	uint64_t inb_octets;
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
 typedef struct {
 	uint32_t packets;
@@ -1258,7 +1258,7 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-- 
2.39.3

