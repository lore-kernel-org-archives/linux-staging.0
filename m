Received: from sonic312-23.consmr.mail.ne1.yahoo.com (sonic312-23.consmr.mail.ne1.yahoo.com [66.163.191.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6936270
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1620659084; bh=F115A1w38R+R6CRB2zM0DnINe0uH1gs/+z4pmQP3JFc=; h=To:Cc:From:Subject:Date:References:From:Subject:Reply-To; b=q9ZRrm0JZwcbAXzRTSKfa4BhPVj8ofptCXegsdJU9oU9B46WviOXqR5oaDe+8zsHjABxYrtov9IENz79ndEGBK6DT+dDtrMaJGJbSEFxbSAVVfwNpaNsU/oo63qub0ma79XqK3DnSg6ZATSVIAqZtHIf/Es0SvZhCCTah26SGAvkkJKxVduea56wUxfZSLaKjE7uRWHIwBUETc58VFbxrFsopWIV3AEElfYvii0hnNIU7fRJOXZHrztl4i+Qkjp7C0x/UB0F1bOp/p/kp8c91LRLkDIn88U8sHnq0ukAISSc5qJfoquS8U4fda/q083kF7PALL3BO9B62RvWeDu1vA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1620659084; bh=tl5pU/m2Crg8uDAYojno8o+e/QEdxlCBlED36WL9I65=; h=X-Sonic-MF:To:From:Subject:Date:From:Subject; b=pVV9kdwj9t2MswTSEWilrXIbC8pbvk2OmJIDLpVQzBvOBDDcgtaiZgk0iKPwqxPGX+0fgP/wg5T3Aj1NThxtdwgCZdqbiTeGDoxg1No+jRtV0BHsttWlvp5uHy2nj5o+aNdaH/4jhFrBWwn7UBkT9S1aUsN0rpMfwhDirzQjaCnHayxf2SG44HCQrV7d8yyYXOcB6zRiaOIzxwfwlsV7V6od+o1msKcbn2KzSn/N28jhDg9C3k4qLR3U4bq0FmnfoLbUCjA0+PTx2pMmAKxaAGgoC1+yCDSYrVB5fhkVnp0nvMCKhL35sM4QoX0D/M4+Cc18y730/sOp+wwaRK4rlg==
X-YMail-OSG: 0Xzij3cVM1kqi.lr9suoSxhNfXv0za.G37RamvNa8AXwRmSKXxcoJRf.zXcRGKf
 h1dqZ3z6CwFYymMCoxZXQxyvmCCg3_C2LFKlfUp5Fu8CgfDPUdJvRNGb8Qa71turXuLt3tgcMO9M
 kmG.gfT5Ts.JFH8MBiLqAur59c.xAo8ZCeWJ1HX0VsxMSANE6Gi9yIue92omb_dqBWq06yPW_a_q
 tgItLEuvCUhTdQHInWd0FSzXKd.JCXRHdnOX_uKBBm6WP7jpbORADTiEvuVq04nRt3J_8Z5TOEtW
 .3vDV2s4FnSfB9CP5fWkdUXZWBEAGGnhMoq21tTw5lvQxdzzta6i_3fMxEKm5Wi4pQrGx.tESgAl
 uj3UHY7pSqMV_thBApucz5vSnTQR71tXlXUrC9KbfYBGaNqr2JWCNb8CXUqyZHT7_BsvHlHkQ2K.
 luySLaZk6LBMKDYjPnACbEpElLM7S_vjQt5zunE7e3jsSrY2KY_zGmNC0puycfn.38HbZ2StG3z3
 zsUo_nHoqSWeDj4Z4ecqwuIP2aeS_TRY7qG5x93xUk0dJxAVIMAh4Hp1Ub1uIl5uTy6AHGDB1mLk
 UGbV6BD4TBdbcEopckKDqpdDJGHGU59bFfxLRq86P1JhwPMTrSxJGvU_EF4NjAEQPNVFG7iFlAfF
 QrEPnN3Zb9skJsGJM_HZq75UTEjySv6W6vtO36Uy7YRyjrUzOytyydAgoXBrX7xhYGVECff0FqJp
 2ApATL66yxcRBAb0T_acPDu04CTSyP.vmhCovA_JjSkxoIIBC_I6MDNY7NvhZ7En_9t2vtbgaSfh
 lgo6nLqCuBnRSmaMiKYYUFp10gDy2cfM5jLNebjLs4s.BR1YzS3WXQD6E8BIEhd7sROfZs1zn6f3
 Mkm3kf0XZPwWmjnM9qzB9Qle62xPKXYaD8ERhKjMnRg78tZKinGFuDUV2q622tpetOp4mtDyWEHa
 FLesz5V3bRaUOh.DubBbHM6hAyR1jxjmANtCSbYhtybixjRt0LNojgWk3Z7tKbxmbdeznDGLqlO6
 C7hokPU43o7sO8zb7Yz2MWJkvb5C3uyjcZUQ84b7Oc8M.sa06uWxeiEDHRJeTTRFsD11IBWoN_eF
 y0PY1_ObJQeHmELWS8JCWgaJkA_Hu8tW6IaJbcIz.ns9utKvMtFkUPcOZPnUbGGyunGr8QjcE4R8
 HKaHDSquLHggMjWd25YoFjeOutBZKWryGFikTH70n8U74RiqF8iYOMqDF5lIP5LykHVoH5NP1J8b
 J6ASKNnOsDNyELGQGD3ZIJLmMJrUMyY3Eqe6cyj3C5AgjTBq54q.ripd1nn24pXm9DMEnuM594cx
 G_SGo.iqv0mdCyhEwNSpjBYIOhfkqJRgJGsz3d5TbLh6dTQGhywq7MkTgr7NGHde9fRsnUmID6mV
 b3dVqc_dizX8ikyTnlT0U.f_zcJeypXAcj7AyeGr4e.tHieDQSFN3Yx.EeZTEGPO0Xjt7cjUn3du
 A6LuWhSnmvyaQhZWHExorHjXcvVqR3N1c4H5QE7_qxs1hT3y0vouT_9HBGMaagWThwbSIrwwlA1a
 tdUYfmPDi8Z7obqfTI1OEA.u7ap2btnEjKKwNjwYhaAtT0BUi50cUNS1NTxRiZsKfYvjv8PHZSFr
 WxLTuXOIRN1jILUfYgjjf6Irs6l.UhT2mUqnnzG5_OHCIz2_mZqb3CiojVw1cZy.keoO9KAPUv2Z
 kyi1TRviqLjvJ519TtsBhAHwxeU4ZUeYgUgMJgzx.YLdKnosR1HV2zudDzkOC9b_g8Kvd30YJGt7
 uIdOkAA7VX3_wQU6E8Tk8etMrCp6pzaqxDOZXFB_xjlA26YULx4urfGuzQQilgmmTnMGDAVuixqk
 k1TA8l07tXD6D0xvwV0J.pJMzBEo1O1WbeQCy4D9S4GARz3H8Ss.TajUXBk3ZK9Y5arzHXfOj48U
 LiNR5N02iOyODf_u8u.a0bReEno9b8FwlujVGwZf._NdcVT0zmreaHaBX2I9uTqTDpop2kHgSUKD
 tZFewsghjtpGhFTZNlPDQ_tW_w7v.5tZLatNmUNe_VCZMW4JCFXUOAcxUxyAObNiBgGEUjllXgdT
 4LSj0KtkWsjYJu5pjeAEn9YwUYyxWo8OI2n52Hk19JOzKmHOzwJxkGNdyClnBOQ2vlv7ydpjX.uf
 Ir8.1z5dU5bZnuf.1vRKcTcxdoZYwrp25zBW550.ryBFTtW8BSnsK2rPKDKugZL8R1pY3Up_FbUS
 O7GRk3a3fCfyzStit9VuiqcVepmZBOs8TmNY3dW1ku837RQTsBv2POC.ZJnLY3bCpRolGj36R6qJ
 B13WNtdnUHZWXFWwr9n168ObzzTyjp4acSVgYZFKC57w2lUqH1QEDPyfgMcdLAIIOHucV5wDOmex
 cLFTykvXNHV2AkI9ehwGYxmyq1K9pCqQTJJfM95K7m2ftK9PKjfpU2ZiaM2XGl54y0FemSrGdGrY
 mTEwAPP5RmL9GMjyD6LfZij18zYwtzRJD0xh4OK4ff9AM2AWBEp_HnIsi9klHV07mvQzn4ijpKjJ
 O92nR4soBa15Ytskh4ruUnvnv48z9Q3xJ0gRVaA.f.9aAbFeIpjH82.o2iEQaMAKNoGRIeAC8f9Z
 1h8MiIEI3tD5i3pxUTsvp1K5fiLasqeMGRBdMa3pbv4fww.yj6hHmqNgqv6Qa0rofRt2QnMHEc3t
 H8gIcBvvQoArflz2NrQxBR2beiyWFQJdwTsevdpHKq7MuX1UbmfzO7E7cL8zgLvGmswOXQFWYaaq
 RLeOGFWp2leCSNIb6LOhk7yFqJ3MpbKlTFAREYAWGI6VvOddlkbU-
X-Sonic-MF: <ashishvara89@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Mon, 10 May 2021 15:04:44 +0000
Received: by kubenode508.mail-prod1.omega.sg3.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 2b16682979adc19aa48f7aa704af5ef9;
          Mon, 10 May 2021 15:04:37 +0000 (UTC)
To: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
 gregkh@linuxfoundation.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ashishvara89@yahoo.com
From: Ashish Vara <ashishvara89@yahoo.com>
Subject: [PATCH] staging: qlge: removed unnecessary debug message to fix
 coding style warning
Message-ID: <1997ad6b-ed63-a939-aec8-18636c132f0d@yahoo.com>
Date: Mon, 10 May 2021 20:34:32 +0530
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
References: <1997ad6b-ed63-a939-aec8-18636c132f0d.ref@yahoo.com>
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

