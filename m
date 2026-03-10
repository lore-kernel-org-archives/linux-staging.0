Received: from sonic308-18.consmr.mail.ir2.yahoo.com (sonic308-18.consmr.mail.ir2.yahoo.com [77.238.178.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5F3F1674
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179379; cv=none; b=u07D8bX+KTObgWMwcish3tKngkKrcHihcK1EpuelouYmCogSesuvhp7CNszzAa2bn3HW2aM88zzo9fVkRp/Iu5QT9qlLh4uxL5Oeb7msxrtyzaEgFEGJRwSRRCwJnXRp0sVcPxET9KPeTSrAu6h9cWVvizuF4wpagjCN2gdQztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179379; c=relaxed/simple;
	bh=1DzWBXV+5vLr1+lFWI2z0dwlPsLcjghaOa2oh9ikV2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWPs6RIOnH/b43HqB4bFAmsdChXOFTRy6twj9Gpe6bAT8naBjpFzROfq//8/jjakg0SCxX79A24IeVaDnqp3oXfpHuCMpUf+zXj9kuImcDaPeQAdXjDD/EGKTT167vg72Pj7yJPlWDDOVMlkSAjMjCILiAB1YglL4GVB30cGbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=fT3yo6c6; arc=none smtp.client-ip=77.238.178.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="fT3yo6c6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179376; bh=CcJpLln/UALF9Xv/bHXjoYQTA+Mm4SxzjCixW/swsKo=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=fT3yo6c6nW6mBUr8l6sn9h+Ppldkeut87VxEILByI2bKr2yHsfL1ra5veANlkdi2dPWXIQBe6kdSp7uiOyh/o6DE+wgCnjO28ng3YLGjnnAezLtUa9hjg1PR7HVPNgX/8OzRB1i6fRTWA5qlcmLgllOlb4xnj8/K4qpY/O9bO0vaKuuKcFlrA+K/vKT+w8a52Yr+8HnA8H129bvzIP/qX/JsG+ILmm1GHefDDCUFPqzlmsXKabvGaouvpOZxkGMOZZXd1deCWe/BHRGt0WG1uwbsTcWwZHgbZ2m3JMOqV2WgyMXPjg9CQWLDJS29b0qoe7SPv6ScciMQG20EYlFgyg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179376; bh=/NpxM0B8W9Wm2R2xbrwigw7+8MmtGtm2JFcqDcfgu52=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=MeAX5+eQWyI3MmlxBT1ZBVPfpUf1bIW3fbpAzHEpX9k7+gN8X68otF6A0z8TALyReYUTzeYyoNeh5JQ74Sk5NmbzUuTyDK0f7RezKHOCX0wfSL9CBClR1WYJBflepnjEnTcBD8XsBa1jpugXhmIPs9C5JCJnLba1A+d28StseEiw+9ndEYeGqKE3rhw7xiq/amkzFr0mzXnOE1GrbHElO3vDOUBCikTcyMYf9mh2QOk+7m093MxGXPqPG97geKahuWGvn3lpK9GjdLNZebN02frSaGJdqbABFeo1XdxWOd1fWddgBpJcrIri42K6+2fSxHykCKBzga++ClRVkhGxlA==
X-YMail-OSG: h4t5tEwVM1lIjU2J5gUiTAmr46HGBcAjQg937rDt62wznh0FAch1vitzQy6Hq7j
 s_neWOF6XZ5u2_8x15UBwlfEug.HjnGcqJpyt9N2SPS3Chlb90GwhThbXa_nH1vY3y4Xhwm7Wz3H
 dR7rj8g3Aj7uiQ6haLZyav9.UnNpTnAg_d4JWczrl.U3lNPz2qVfsnPc6aijspBXjgu3KAENXrmt
 0DrB8G3EXY8mO24rmfxBqirgebJJMKDRJQ1MVb.31LkXj6m2pXAmO5wd6dagrJbrqtUCxxxEsEW4
 1xKsDKd1t79e.R4yVHr6ftv6KKTyd2exdIWuL8_M7fDQs.7j0aP4MudFdTfEB1qVivpfDWLinDRf
 DV4CEkwNF07IyG6o3CwomZ9BEOXBEy8uHRQQhYdId3NdAiyJEGzF9q9e0ykumzHLHsGAm3euAmbb
 gsMET1EOcoCBKkewLPh3SbEEnVp1y3BAqf0omjbA13RbQT61QMxQl2dQbOFEhjeLmyNvinccoZ0K
 jxDPVOHkz2HJYgaKwtb.lqM7T2CZ3uhHMELwtsuptR8WL8cQAffoXVGT7iHe4W5Vu8Pu_cnVHQGp
 D6hEYe6kkyqjm1tWNispbhpWG7sZTFFW1FX_9d0vBLnV2TiXItwvYnhZAe3sfQHONyjt8PDPuGcl
 cklz3JC8_jqkOWb_R7C_wuzi44oEaTUv2uFe.qxmchUeLSbWtgHsEHjR9sa9MxaZiI4ors6TPBQ4
 lfcPAvUn38M_KuOSyRUQHOc5Pg1ZQDI967aj4QX_VrJC3xiYOiDzwmuLXkw5Cob4bgljxTK5Fiwj
 Jc4MBUPUcX41dxw76dDWdkaXd5BXoAO.59gulXZyu1kOsyGyS4Cvg94cmlBtE2omFrLcR4vAAAcv
 Ue86K0ePJKxVLNJWcYXo.ckvcTqHLEjODW3hJEk7Zy5KGjrrDltzVNUK8Tpiwkf8u171xNhduEXW
 ZULdyoLoqGAIIjXVT6pgd1B_e69PoT78jua2LwtnS6VpY1ZOwpvd6dxCtnRso3jRZo.wlbp3rwCD
 nTSuEItgPTUATXCJiAcTTORWa3fYdyergyqsUb3ikU.K7YK0jlXGUhHdob807Ee2P1_A9DfP9r6s
 cA35NRLZJWnZVW971bGkbrNsXJ7V8iQDDGbtiat6WW96b_IgKckt9mactc1hJQ3LKqZlRqW7V0Xl
 SxRs0KQ5cTTBdrPVRtpzYgw4tMSkshufpED1J7ZkaY95xvS85Pj_eObQl6s_t6MLRN8aOu_yrJBS
 70TT802WBjgVKLx0w5a1n2DizPFe.57BjQMVG35kYS05.zb.x3c.z819UwROlNnrZK9fotcylHwl
 NuK.dJLLmdolfG5P4f1oRDDYu00YaOmnXO__F3023U4iZucuwpRgXDQ2r.5zwE2PYqEx.OoLtQGB
 8x5BTXEIDaLwYJeTOCbmup7JznpuQs94_e9idsSJaSxg2yHhiM8VcGn8k8hfX8YJE.cyYItjyNWu
 hEOxp7XlKQVaYEPwaC2Gfe3oNP2Rfou.B0yM17Z.aP.XAmzUpYHSo1FOw9fbAwKLxwbPDHZ0hM6a
 0P0oCk6zBGFEQpCopYxDpFaN.4SdZMO6DBj7ERi1rcolnJ8X29PKnsqgYUAYMreVIB23iDh4Lfvh
 viarQdLsWhodZthZNG5kNg2WyFK8T0l4.l.AEIwTmP72pNXT5WFcGrtIs8oVR3oj81RQXE5NeQQi
 xQYgvaAKny3n5NxEkVeOmzH2bRowZNzUI8Rpiz1hPibLxGORuTfh4Iskoe8c29nbrxgftIw97ds2
 1TCRqxmJxC5XvnKDmlrnrg3rkUBgYtjTgXf06FrQzTl3uWDfAfU3fsob.nOo4IyovE.qYi69d0km
 IrPOxm0hJ2Lie_Ykgr._DPUo1PQij1e1P2qK68ff6UF_lka_sxmDegn_YlhjsX0vIRqRFecEuku0
 oOBxcfsGbTaT.rdl9bRb43R_QSjnvG8ECWsHHlDKxyJN5j4EsB.qN5paS6MTtNibqCOJ7X3J8vtU
 35UFJ49qp80vk2gmcuM1UNYzpC6eQSmnvFEHkRl6z1wX66VIUbqfvMh0gnXsn9z72HTouQzinzsI
 IIwrQbmIu4BEd2Xr1qHnB3C6VUVenLQczBfOPqR8SbgEe2SYebtCICJqgvVTcSOX8IvqwIcIQ33B
 laJ8PRS8rZ1HX.cmajfvIQWFJDx2TX3JcWBqcssbFQEnsNk5dJyoS0SsE6EB7c8PoYGYO539KE8Z
 Epff3GmgSOAzIXEzuYq0laY.iiIKHjNu7fiz8pEhRX6CPC4lRrHGtAGw4zFlomU_7dk6D01_50t1
 5ZgGVlfQ2bN.47VVpwqjkPos-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: c50d3d1c-e5f0-42eb-ae2a-a680a6df5068
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:36 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:24 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:20 +0100
Subject: [PATCH v3 09/28] media: staging: atomisp: Remove unnecessary
 return statement in mmu_public.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-9-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3

Remove redundant 'return;' statement at the end of void function
mmu_reg_store(). Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348318..2fc137ef46da 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -63,7 +63,6 @@ static inline void mmu_reg_store(
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 /*! Read from a control register of MMU[ID]

-- 
2.53.0

