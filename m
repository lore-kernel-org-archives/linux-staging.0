Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31BC3C9430
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179374; cv=none; b=DvQ3SLlb6h+J1x2lLprymXVZuvYqC1BY5Pug/cJLdPaWqAvNgNFrDqA7W5vK1AbzeFvYrBH5drcYFbmFG8uzJVautMJtStSWXTJQyqGcuA3ZAxnPNDWHMqrLP7DiRKqMYoGyA/zcxLfjGC2jnXfz8S95ODVyUJ/n0QjYJvVUMXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179374; c=relaxed/simple;
	bh=YYCRsaRwiL2K/Tso+CYX7zMuw3BozRy37V2Ng5nPtSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+a51r3g+aDYj6S5qErReHIJbxiVK/xplPqIGgFZH9bXDwwwZbiZPr/1D9u5wK2DGwB0rZVmMOS4P/DYnK9qvlDbAp9EEfbSKc4d08na+N0oSFHRObtaQViZ4e7RHgAPeNn/R78zhDhQdxW7VMopiwVgOOY06jLrylRKXktBDJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=k+Y4GVKd; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="k+Y4GVKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179371; bh=WpXlPGXKWmqvtwttIuRoYAJYpn1ebnVCHTNkt5DD7RU=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=k+Y4GVKd05o/ciJDaWjhYIocAzzTwSIPJMmMyv1aoq+WcUfZDtrg/Pqn27IAxbwp3HKtFZz0dT23gjZ1GwPZCFO0eNl9LsMytB/nk/JogwnAJYI/bGcYh3+nRoEI6xSLJNhzOEBCAWIN0L1izVqtklaQ9H6a7d73TDizxnyTn0RlMrVkV/rEcMMpytr//tdhYh2r8ik5n/KbojM+mTTBsYZNZ3X6rPh0LBG/ANBiUmBxcdbJ36DTkd33Dqjbbx4wGXtcFA1WvmtYMr4V/DeQf+o1wSmrEptBKNyPTumZeGHJT9mJ3hREYe92erRU+T3AWNChi4KjLgEBHLsz5dTAWQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179371; bh=TYAGusmEAiz9B7uilim33GOlZHiEyrjn+cDKOY0j2jz=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=mBdlivwpMqXZSBinjyNg9/8nLs3OHU/nuoqwIP1uk1VYaXJafFVk/HvmPP+xGhbPuQFnimYc4AkwaV2IZ5pU6u8A8NggDdytSJFjY/GjNnLbFYZ5aXPtZhPJibuFLfVsNMjEMu4m6eSBmz8+Hu5aH19cN9gL5souWVqpl4wJE2YQFKOgOpVKtukt/0Jh1B7vndb7kcGk4hs7njfNLo33qTa0QwfY24ZdrTo1oGsTCvjXxkA0gQ/bz6JLpHWNNk+zJn3kFIomA9SYu1TZ1AqhbGIm9jH5whk3OiK2WiJlnbZE0uOI1oxn8dW9QxZHY5ilrN1twYpSigVaH4Y75/Mhaw==
X-YMail-OSG: NRJRhP0VM1mxQZe.asi3CrFpqbq.gyTdx8Wq05Wj..sH_ynL57iBxaaVkQP_qMs
 AFmMGXCKLs_Z5MHvwVnxrDF5y0oPKsoullB9FRNHO3RVjfp5w0.0M0bf8lMsEmXcAkMP.wZZzp9P
 DEjz7Ne15NCFFeWmZHV4hIaJBhtI.5Goj0LgoOh7t5_35Zhw1vLuOF7cLr3ZIYFtTCpxi6Xn7Q9H
 Cp0OSN1dQqwWjPZrimOqpfKxjS_BAREw3TkK7NmUNFoixzq4KJ5YWZ_QgN8wpfRI4CAKiFltVSZK
 lS4cogsE96vDYRUd4zdSiMtCjm2E0JA0xcCSpovk9DukGWNLiH89Xm8FPwQ6dca4vncVy_9oLQ.9
 ppqA3v43.TfWalqfYzS9uk_4_dxtKMwdZBDcdIQzj9YcW3Wa_Fq_BhdIaplZUz3PXAH0xkSvnEy7
 MUkq5A7Y5jDc3OttvCh6VtWx_qqZ5.PhotAVxj060ePaMlQW4IxtMO6hc9goo2wIs6mvDz.wNerS
 dA.oHUehfcHHjCK1J72WahMp9cNUxjKZcU_IHJ1Stjw_G7pTDkYZozchkepGYFeZKOVeU9OtZ8iI
 5HfJ_a3sWv3ldmDfrxBNJEz0AmG6HnXN8DNSJT39XZTWlP0Y5TUoI62uNuCFkJEKtzTAsXv9hYf4
 YmdSPyzoqTYSfOf.No6MBdM19l7j3cczv.ZlSUFS2dX6f2GHNGQ31KP7GUzKBSbwAy5tBz.6JTOS
 eaM1MSfI.BIUcndEwyjTMhuUeVopQUdD8UkmOrmD7ma9P8GA4D0FNEKVriUu174sRIYKcUGrlnoe
 QoUCCbeGfOH7Z9xZowarigkYgLiHYWsvLTVfGFouYWC7k5a.3msHpekpKlC4V6ptSBL7sM0cSc3e
 HoWo6oY_eEy7z_RSGy9mR4pT.8sPVyU_b8KLrcbwbcdDk5mTdGKhhA1mAS3l8.K5LnJHHlQR1.86
 LfNGSjDrGNyYycJrqrcEKE94LaBdH5tvYduEN6Yz5O2LV20Cb0RVrgEfWHoJVCA.SMEwXhSfpm7h
 x1zu65R8MnnbjrggaCqmUWNTDpNNiLSJNC3oEvYjuD70DVi1yLeipIQFsbElyrH_2icVPt13r4Ig
 blBHnNYh5qWycnqV6G.VNuHlK_scTQI9s3lJP54W_4KrGuKTyy31kZs.khLyQd5Y4oY0szIaVKQQ
 y8xRQvkX6iZeP.gHG3hD4.HbN4A3IOVLreZ4WFyg_t.g7UOSAE9SZpz9r8XSWLTLfouu7iamOtVy
 Asx407qXlHNnoiGUucVoI.n3RFgmwTLg0BUihSrMsFQp3sqMn3xWIxxGoQ6QCr0ghuHZkfvrWqTc
 sUN387Pm9ZGrGPYxuhySeFHi6Mc1DhVUFgXqLxju1sUPzkeJYYtryscNTV0r7gvrZHeR5NjwNy.A
 Lo2fIq9Y9k6_BiJDwOQZhHn4x5XFV.lXMPFrqkxh_MQsBhTnWEHdtoWa.gj67m7wEFX2R6P0l8Fy
 UzwcmYqXfK1VCmnxQmDez8UV30xtbcXvWJvj8NglseqcmS9aUv9WQzYAXRcGzvJPy54CLG_TvNxo
 U.58xl6ComOkCWEcfggKNjAZoS23yNdewI9K3yNvywk.fFQm.bQr3pVQV9Ycbefw9DbbkZtR_wPw
 eeFDez3K1SRHDN_C.Hv8EnrpATIPsA8pBWaXX4.z4jQjulm_bz1DjODYkl5S1VQYFizKYqQ.4mPe
 r.jjP_XMCli7vLML2H0gjsu_g0W8HlAx3KaFlW7kJmFvmR9xnLlGJzpdlgpc36qjNAYzFp9P330k
 fwvJNIkvsl7r9wowrZPUHwx6kLjoOPFbCusBX5Fo9_sMKZ0EVHbn4UDs8n0cuQDa4AONpNTmxTba
 g1J0RQIg_n7pvSoe4yOii2xSpSujxkCJJqfhNknTYb26dxxm_p3x5GKhm78HmChXS0FtbmCQ7MTH
 RLrbBUzECmwSpcDUnMKyKh04XM30iVCD1tTXRHd6Rasq.XPZFkzVl5jIz5WAlciiu2ECSsFt0DOb
 w.DTys.4lwrLxs.EFZ35Vq_geh7gCArecoEdjOeD6EYLXlu2rzECuGuYhWInQqGOfc5Vi.kCW9Of
 XBxnICIaNGLO9YStl.MkNX1_t2mtZJ9l.qctz9nxTVT8woZ8h.BWyfo1NG.zOgFRI7oa_ZNwD094
 V5QZv06bCUeZxwRuBc554IXS_gptV91XeSFTb2HgNXh9Fm1FTS8UAQmJsTX8bGvaq9sSrQOfOysE
 CMrf.PXULjYfFWaHhSRy13WYGwIHbPuHGqUft0xb2a_WibY.0OY7CG8i.dyy6mxAZDjz9GQoYKSL
 DOEVpJyDdffTEMGLQrrnrnqY-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 223fe060-bd87-4acf-9d09-07abe9575b5f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:31 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:20 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:15 +0100
Subject: [PATCH v3 04/28] media: staging: atomisp: Remove unnecessary
 return statement in ifmtr.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-4-3fdddab41271@yahoo.pl>
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
ifmtr_set_if_blocking_mode(). Void functions do not need an explicit
return statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 50b0b31d734a..31dd3f99e28e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -472,7 +472,6 @@ static void ifmtr_set_if_blocking_mode(
 		}
 	}
 
-	return;
 }
 
 static int ifmtr_start_column(

-- 
2.53.0

