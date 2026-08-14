Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E441A797
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694231; cv=none; b=C9dEKabupPKVrznZ2Cb7sXfXsI8EtakSyoZxUsJmbprY90+zx5gGOHqNV26N35V9hIG3fmTDskQYQuNvXUFwsWMB3o5vC3/Nd2as53od/5IbHGKamEhXuoy0DJjOBA6n+MxI+fztXKmjeroG+OW1q+msMJjjOk94uFIxSWnRUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694231; c=relaxed/simple;
	bh=nrPQO0iIItATmJ/aS/7vY6iL/e3Nbh2iCgFSaekxpvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=sfmSCzbWcyPzDloeBkbnbNkUk6dubPf88dkomghEInv4/HL0Iny9RrRC2cqiVIu2QlLvYHZYOCT/sSmzpSiFIxk77xx2RRemscuMToCuqQUli1ZpLkrIkDCNQ2kcS7egIppXd8yK0j6/7Pp9x3EenveTerj681MtiRfJUDI2AHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=l8Uyozri; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="l8Uyozri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786694228; bh=wtE16y1FuNbm0MQIN12RZSFZ5HeO/AXt27hv95iYe6s=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=l8UyozriAuerhLUXd0S0QzghNCrMDdJBnaTECqsYVemTGLhXnLev/BfPH70qrki7N2dQuCbL+Viyuo7sc8uQLkHUyY+qyNKAeyqohv0P+/ESwkBdfZR3bEOiQ7aw/CzcqhvjGb85f69H7dm9FE5VO86rUYiryCb6BaYvgnA6wJ+FiXRsevc9NaMwIvjiODOzAGA4ylHPjHxEWipX7xCc/x4P3K+6jyPgoimaaKXOugXiv2R34d6J+yz8LGwRf/QvEU2WyQYGHQREY9F49+4hjjSPZU+4quRcquP47zshjwmbzi8C/KKykPJEFx19gFMahlDF9aa/YWuZ9RQqTyv3Ew==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786694228; bh=W2rkh51jNiyBNs5EmzZFxYeOOjd2K0JM6gQ3x/iUQJb=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=nqikwCWyIuQo1h/bilx6IM/7yIiccK9O3ye1QLUiIdmdkOifbO82txouDw3GxDeeKLHxiMcrixf434HVdhoOqoAVR4OopO5ST3PqIQPF3w0BMGHrvBl9+C5KUYJj+/vjpTZXa8Y/2iQ+GllgKEpqbkLe1sqs4meP8DS125xP1S6kPsYqwRljKxmr1mI3UFnkoXvpSAHrqjCs3WYPJO69y0dz1ODiFc64gqdNvgpFeKARpGxqANxPibI9WM+xfWQ20po2f9mObzGjqZcg2pk5c5j/7FS4HAx6DDCcrcO7S+5vcHlPkX+cuiIk2aA62n5nDAVKjQqprtcDczWLUVe9Tg==
X-YMail-OSG: .LaRsMMVM1nG1l8bVvLe.LPELHlRSUuQBRcGoSX4Q7YxPjLiWWWNFoiOZYp5Sri
 86vgrho8QogQUw_bajAUg8zHOToLFkIh2BRLaVW9jUmmTFYXkNjc7LAke_PmvAP61ETN2LVoKL8a
 jvQg3epnR7uc3VYBz9kJ05r3n44sPmZYgd_C9KbizQbg56T0LUFQtNP9X8EuWwOwRf4NTRUQYKP6
 _vOxLgNiSxGURZkCOzEwiy2mO9tUKKagQ4URrCpf7ugGZDopEqBfHGA3xAXG3IJW0GgyMwB9IAcX
 KKQz_mqnAtZxZ19MOlbJGMp_zuk8ODJx3MGpuIgg4NPVxAl0KBPuRiwmHo_dEoSjsPwBjnT5tfgC
 vezOS10Xx48_7zThVPYslAk8C5Hf8M8kQy1ZggAxh9GJLiH41VqBpXiIXtNCT7G3qYZQc4Qtto3X
 iF1eW3lwCaKMfXeA3FMRSfwnmaXc47SCGLbwpdOOJrlixqo16pMM62hTLpKwMh2SRO.HI9L6Dc9.
 zxH5E_oEUfjzSOnVj1txGs8triVPITeCuf6fxgDhvWelr65qldGwnH3Mmiqf21QvSynRYJnv7jMw
 UDZxB4ar5852SmzIEuiwT4WLR6Lv7.OUDE1hdjKNwbScntFMzxSC9YeYcpPcC2VXvAr2n6jt0V2p
 QtYC1xeCYmxVztgbmQDc3lCPVq7t28WSszVPghKGYnM.PXhGt2XLoJqDqe1zBzbblvhfy_qMPfgU
 .m.jwUQNjQzs_2ot3QNUmjS5BHmGRgOBxZqCsdCCn5qavZbsZMC39ZIShaSw5SJ4oatP0NntT.A1
 hN4.vNt68O_7z1rDe6OybmHJF8gOsbwgkeXytArbY19Kkev1LALfjRuPmyGQ6dWHcGEOyJmPvhjD
 qn95F8nU3OC4m63PWaDYwpleRx6eoJYAP0UxRvvqBacKeHafmQo2wtDMFOKQRTg586IaK3_Iokw1
 .hdOBcr1uBPWBdlujILwjgnmUqqEaLyFPFN_WbPu9QdFvygbh4qpSm4oN_DmloRi.BncYQ1.54Hg
 fhCVrHbQwHc3b8FX3vNpIsDOGc.8Uk6gMiFJkPPpirRUl.uP_wZQClDine2uNTP4OA7u6tf9XJyw
 v2mEzRnWY88TDgsPlqzXwcpyv4uhEaWVxydE_r.KjUj.9V5lWMB2LD_uzJT5UlzJ3EPM.9gjXdFJ
 2HgiNcwFQl6yzxCOITDYOMIoYB5ZFzBOWdPncVonX04rI4LlDLvcjl5Q6kOUGdaqATCRrXYeSYqO
 Er3AqATq8.JFd9BrzYbXHXYNj2TJaW8pubvoKxGBos2mEydpYMCS.U6cnKTic.x8J0ZMh.IK3kqz
 uXjZl7bijRDYE.08JqAcvEoiIsWVHSVcDFMn0r_PS2314_z4d88ZQE9iJZrxVXXLMxjU6bWUeosj
 mXVfTUaW5.3Iv0Wsa0lMm_cIwN4pBFuSmsJHxhfb4Dotq6Ai5e.jclTqgTMhlytC5f9xLQPa2XFW
 QG0ypndeB4ACN9q1FK5un3MFC6AVbzud.EyCao8mnqB0JvZ4QdWbi.RsOoqIPRaFa7GAGZdaNG03
 QyeiJHvwGvaZdczRjwzZ5fUF5I.9vLVgzAxFj3OHvZt2HeNp1zLEi6C6ZfKFmuJFtMC.gWjmqn.v
 qZhm32Ayz3N9i62uj0UX_gutvOo6GO23yfGxVCc2Zy5C8fgfeVBcXC_rSvnXPn07YeqVBb8eM0IF
 w_LO.psIcNGvSAI5GpSHWQzBHeRnkp4duY6PdcYGxq9SsBXmhWsaxPOOmSzqP8figMB7IF3nGg50
 6zmUdeCsGAuw.s04RLJOKh0_bJ3EfBxvHWrS3v43era8MkJvakA0wfZvqdkPjTWIDkNNe_5so9Kh
 c1ySk8BJItqzfIsUQCmyPAfJ3Emrvvtwp.c3FL4JnA8QnfeBkWtESzt2VTOkgLj4IzohNH6WVUZY
 Tp.OX9HgP0jXIUMtZySieuqYjqfIOrnu0yLBCC98YiwnZIhiXAcsKDF1CHk_yFQhQdXBbvCsbLr4
 HQH27Ju7mISiToYCKEvXMcl.A.rFQPVVJGaHodOPdIcBD0CK9LNG5nFNzJvUOOg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e8628154-6de0-4b16-a62f-4e04133acaeb
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Fri, 14 Aug 2026 07:57:08 +0000
Received: from dip142.lsn.ir2.yahoo.com ([87.248.99.151])
          by hello (SMTP) with SMTP ID 8603dcd3bb51cce8243c85885af5c82f;
          Fri, 14 Aug 2026 07:57:06 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 14 Aug 2026 09:57:03 +0200
Subject: [PATCH v2] staging: media: atomisp: fix typo in refcount.c comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp-v2-real-v2-1-8f5ece54cc79@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrmkyFMcQr0JYDPCrNQhkCsSEc
 HdHXH6L93YyRIXRLdspYlPTaUyQPKPuGcYHWPtkEidXVxUXDsv0Vpt5E44IA6OUXlzhW3hPqZo
 j7vo5j3Xzt63tC93y29BxfAEu6xWscwAAAA==
X-Change-ID: 20260814-atomisp-v2-real-e32d2015be55
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786694225; l=1528;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=nrPQO0iIItATmJ/aS/7vY6iL/e3Nbh2iCgFSaekxpvU=;
 b=HyhhAxB8Va6Y0pwvo/7OvHTZn57tZA6edKGU5rJTeXztab/bfaHRemIULkpDh8djz9XswQmE9
 +OL45gdcwZLDtluYIWK2RPVFHBPZGCXuZ8eV3Co/QSw01k3tShQW4jJ
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260814-atomisp-v2-real-v2-1-8f5ece54cc79.ref@yahoo.pl>

Fix 'aswell' typo to 'as well' in a TODO comment describing
refcount support for memory types other than ia_css_ptr. Only
the spelling is corrected; the TODO item itself is unchanged
and still needs to be addressed separately.

Reformat the comment to a single line, since it fits well
within the line length limit, instead of the previous
non-standard two-line style.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Reformatted the comment to a single line, per Andy Shevchenko's review feedback, instead of the previous non-standard two-line style.
---
 drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 4a8675d0129a..168180f3873e 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -15,8 +15,7 @@
 
 #include "ia_css_debug.h"
 
-/* TODO: enable for other memory aswell
-	 now only for ia_css_ptr */
+/* TODO: enable for other memory as well, now only for ia_css_ptr */
 struct ia_css_refcount_entry {
 	u32 count;
 	ia_css_ptr data;

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260814-atomisp-v2-real-e32d2015be55

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

