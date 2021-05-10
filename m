Received: from sonic303-21.consmr.mail.ne1.yahoo.com (sonic303-21.consmr.mail.ne1.yahoo.com [66.163.188.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E037D70
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1620657825; bh=F115A1w38R+R6CRB2zM0DnINe0uH1gs/+z4pmQP3JFc=; h=To:Cc:From:Subject:Date:References:From:Subject:Reply-To; b=ehrN/TjoL11NojLCHHxP+v/hxp4NtRZVwMnOQR9PUaFWcawB8XNMaW3tJk9jGs4EYfr34C1NqNbMqOry9bs9aUD240Yz2XnLARJ74rqe7A4yzF+VRNGAH5zWfBapkmFJnHzYRXoGIQaMoEA/K4oS6dgbyrebmaNHESnPgE259id3SUmxtIm7AkocJxo8oteVjzMME5IjRdAsJxiMmgvIoA+aBx08rDpTtkvdd4cWDUCAHopf6JO9r2pzq5NtEWJZrAhjhZlRhxYSkyEdydKE9AReJNQvxaOCouphSdCuP/HKbgtD2SsXz8SYwgM1vTz+6ybjXVlXzhcfuUxUysk4pA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1620657825; bh=jSEfXzBDqyI5WOPGfkvS6pXUOX9GntaFB6ip5Rf1OjE=; h=X-Sonic-MF:To:From:Subject:Date:From:Subject; b=DDZqIloY7wOqGDNPAqsu1W0ToiEVuKQmhJ8ykHtAp5t8m2uDyfu2qCKN2dC81C6B184pWS5mIVRKubumkFkuAvnU+qe4euKrA39WWYmpiNUQsbLe6t323IkxAPhVx/B4aXTYtfT+Xg1AtT0PSNDq6XtlYSCADR2ZPyONj2GGjDgpGEIZ9FnjGpxC67bJGQTnJBSeRz8QwWxYJByMqWBAV+ik7Kv8B9GfaCoIzGqkRywdQhO6abLL57A6a7BetMVd3yWi6078XX5amAlJszi3X0CTkdyVQLVcMXhBVrWVpJ5sMGbUSvfiueTtRBSSKYoBRlcgOZvi3oL7r98C+WGYNA==
X-YMail-OSG: VacYQsYVM1m0xoiNqr.bQjQzCsLlgPSR6ckTr13EMsy.XQZo8EUOYIeuF.TRXc2
 .7hr.r7.AEzQ0MJA3B8vB8CUZHYQPk8L2D1GiNwOCQLW3nYXmGSujVn3lXOFGOlRgytW2lmD_cX6
 ohCNN31wlhoyOf4B7XBORPNkbbVMq5lIG_UAOHqeUgCP_rRnAmpBCu_jpKQqLqILw0sNCcLvum5E
 MTYkI0cUVZxygYaUTtfzQVqRZ42av6_Ev2zjUPousgik_G7xchEl6FN7JC7CUvODRcFAd0ibJneh
 SsTq4f5uB86ip9KnV5jjrmk9Yt6.AWr.9qgbd26JW1CS79mvuC1HQu8n_3NmDoQ_B0fr4v60B.Sl
 hJ1OlRMJEdo6606lMVCE3UbeJmjIDg.yHDnyync8POdi3oyfPmgRaJtJQXlF.ytgmvo3CvZYEcaW
 Sx2u0YcS2Tl1tV1.wv0f0DHBXjuKqBQbBejJbmeYide5a97XXaH_S3i13g3L2TvEWjuYp_lEndAw
 4pKKsQ6RKT2d9jhpLL83kqjROfZYwAFDjrVqHsRwvcBshbaye5ngw8CSIhdZ9gabbA9gQYLQI5CC
 f_Fngtnz4y32RzsUuj57PdRMjdcXDeLus.q3pxago7qrFw.NXJyr01NM7WT6XmI4VDVPaZcENwIa
 xLZi38ZH7WI96VWMHJbQtNiTPs0tza_pSjfUSBjD2B8hUB1dQPUsBhKo_avIubAikh2cqIROHElU
 XgVMj_s7URBrjQzU12lQMg8FDNdmFmbtkX7tFC5rpJPbPLF53O6.cfhPF6ia2stJD1aPvhrEM45p
 0tZIpCqf3zdBC3vodmn2Pdt.Wk0u11.x0PFRbXQyb353YNCKFp8ywepmu7igFwqa3le6PigzUxLn
 IT8vZlfCInGA4OKVVG7P6BIRP.Y9FK7N6qtSGIvgRl0cmunQqhcyXi3P7kG_ScL42zdE1.qdzSyC
 HCLW30Sulz9shIKJh3SfZm5n4gbrBsuLHS.PNYb_CAsJu6GqMaxwPd8Grq6Ae1xsyBSIrzkfr5bA
 bvGGX7mZc.4tzPykTbt.970NOncuh2MLmeEdM7c078DgSKleFciFHWAQGp9pgy0So8khJVka1y2W
 ig9DnsEFUp4cZ0pfOounyI9a8O_LslAoWCThaqi9GOOCVHIF7WyBYNQ6XcMVAn5K.9.H1NuX4ILn
 WkfxAakapLdhhmh7lrgoodFxqUt.BeAxuUtobsZYoZqmJeWuuViV4YIWoO1I7.sRRjMMWvB_7VWH
 xwxqJkbM6qVbmfp4Tq0.3QCUM4CasVrSCbzJtBpGhVTolIqsRWzUizUSBB7CL9_zj0YynQcI2inz
 G0P0UUW4HpAzg0THYZ28AX4r5GehaXoM1tdYdsQHFzGHVIGTaZ9nR0ztzrf86jttFEK0wGKt3FuC
 ndhs35njbmVEBFGNzF9U.dtR93KPAh9StjMl2hxTugzPBsCJO_4UcunC8d5q2CL.NaOz9M7kLaBL
 cGGLPg1XxT988t5OcVNnyYtnBgVQBD50wuwpLAvSAt97d.jd.CbjEeZHslsvrDpmFXT5t9sKtuws
 9_8zVSOsnWog6pL5lyidKtDG.KMmVryszg1NnclegEmARfQNCWqa1uu7k_zWYmhMXmIy6NJFYPdl
 KojMQRHjlgSeNY.kdt4pfKGu88p4RCU1XaDoes5VwnyZkQaUZ5xkXHXL.vCxvzz3GJWm3mw8lFRR
 Y3IIHBKCUDAdb.bc80MsE22dZjFGYnK.u0wm2T0tWS9ICaZqfGz6f9Gx7PBRnzFw1T6eVnzKcGwU
 9ZKvTeYCkdct1UdkKD0KijnSarI.zWT.J1H27SLFolAfk_MLxBYVAncz23KCkovayswwWJ89uWF6
 eNG9qOH_pEyuJarWfr78n3wF8auo.VUTM3dzdb5iHLj9gmmeP162bjgx_6oU.08KQ6Lzu7BVC8CH
 JGTwEkUMPwSp2IXBMGxDdwx5YRu8y4VtgWNg4GkSWMkCOMagA1PWitMSt.ArkIQpi7XYPJJ75VKS
 PY4x69D.ekI7RDDbPtpzSmW9w9cc1DJA5.dh0lFNevn4YxQKUjUwojWQOiHm73eH5Kkb1fkj7j.7
 afG27bs3MKPXouVGaUj.RQS_z5dNP1RVg81CpRLQnK5.4_Aif42XuPUCIRvBsE3z320c4oPlekV0
 IcUjgWMQs.uVUCdphBrufOUKtamuu95PhAIrn6dPnnrJ.Fp.NWStMnVIwkZ1jl10WwOuct2Nv6eQ
 X9R5QbK55Y_3AbOK5Vh02XO0qoU9uNsHZD93LaC8ozpBKcsffhW0v4PwPoHE2N1hajn_n3lH2uFQ
 pb1A5H43TdLwIzQpgPIFXkDjFUVvEkc3AYJ24uDt6ij7HBqDXVVUOCOUZniO0AlChTQJ9ZolRgY1
 pLlXEX1C5oB2tMoHWXp5LQUew_3EeyxaOqU.0cCJdagsnZ14oQ9OKbV_CocGkUuhCUJ5BqkDMbMQ
 v05zXivCuB4thgNGG_dztvgvxjNDoqZmwQR1jxMPydNC2e2Q4W4UQVQQbaGuAIevdf5.DbuT3tCO
 muZQvNMkf7HSM7AwsU4MnE.lfC4Gmd9tDoN703rTjl7qgYnyNWPVgvHNsU3iggPtlPWl4LSNlbFN
 uGSUV0RtPaXuxjTeRKb8PQ.Ec8GvlWbnd5VcKQ7z14wLMAtx.5h0yQdugBob7dFT8lwBmwT0HADR
 LYWMVrVHQV9l4iSTVnmZLSUBF6GgI7OPvLQ4nIBNlOr96aaKkRGJAWWZmvgqE2GLjWkL2J901n.T
 7yCp3f8ztSgTIljBZSgK0nMYuK08ZTeLatLsDar5l4Se9VGZL5NbjMKStihZ.73s-
X-Sonic-MF: <ashishvara89@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Mon, 10 May 2021 14:43:45 +0000
Received: by kubenode529.mail-prod1.omega.sg3.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 5442f17387fcb91b36ef36a5a4fb1f94;
          Mon, 10 May 2021 14:43:42 +0000 (UTC)
To: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
 gregkh@linuxfoundation.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ashishvara89@yahoo.com
From: Ashish Vara <ashishvara89@yahoo.com>
Subject: Subject: [PATCH] staging: qlge: removed unnecessary debug message to
 fix coding style warning
Message-ID: <eb4c5af2-2980-a0f1-4708-a48da9570225@yahoo.com>
Date: Mon, 10 May 2021 20:13:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
References: <eb4c5af2-2980-a0f1-4708-a48da9570225.ref@yahoo.com>
X-Mailer: WebService/1.1.18295 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo Apache-HttpAsyncClient/4.1.4 (Java/16)

From: Ashish Vara <ashishvara89@yahoo.com>

removed unnecessary out of memory message to fix coding style warning.

Signed-off-by: Ashish Vara <ashishvara89@yahoo.com>
---
 drivers/staging/qlge/qlge_main.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index c9dc6a852af4..a9e0bccc52d0 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -2796,12 +2796,8 @@ static int qlge_init_bq(struct qlge_bq *bq)
 
 	bq->base = dma_alloc_coherent(&qdev->pdev->dev, QLGE_BQ_SIZE,
 				      &bq->base_dma, GFP_ATOMIC);
-	if (!bq->base) {
-		netif_err(qdev, ifup, qdev->ndev,
-			  "ring %u %s allocation failed.\n", rx_ring->cq_id,
-			  bq_type_name[bq->type]);
+	if (!bq->base)
 		return -ENOMEM;
-	}
 
 	bq->queue = kmalloc_array(QLGE_BQ_LEN, sizeof(struct qlge_bq_desc),
 				  GFP_KERNEL);
-- 
2.30.2
