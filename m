Received: from sonic304-49.consmr.mail.ir2.yahoo.com (sonic304-49.consmr.mail.ir2.yahoo.com [77.238.179.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D319EACD
	for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771767542; cv=none; b=c3Ju8IcfJDs2YuoL2liSeJAx88nfi1BnYrkQ3xPUVhlKbJ7spj09XNZ8w3H+cEUhbjIhWBXpR2v/nM0t2TzuKp8L/MeiJb0y2lEbzq6o/N+ho9mNiONp0Dmpv1SSJvh96DuneO8RHjHdWxNjYkallZOvXMxxwP1TPX2HTT4ACs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771767542; c=relaxed/simple;
	bh=w0CP5PbtExiLF1kngJAI3FlGH0FrwT7naYWfjv/ZpoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=gZNM9mmNRwcjKLTSU1+RWd+fG4l4n5FEJyUh6Dub8EdlhrN1/GjQ/nYTT2B0wSGYQ4aU1RtF9PgScD1hOL44xHTx2O5IZjHTbjeejACLwFGL20pSDuhz1iP8G8pUlkot5jvaQ7xMA7KKUHZlQp5epSRDiXCwbTHj9IA7vOO2yW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=HhulLuah; arc=none smtp.client-ip=77.238.179.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="HhulLuah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771767539; bh=307bPEkFTSndiDoWgMPOBxT0fXFC/7IzAQBC4rm3Nno=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=HhulLuah6880E2HORIaivdGeXLGiRlYiFeniKL69VohnX1fOwRO0BKZjw6LFxTH2fKUZCNc7uDhWOYbseeb/u8tN7fZDA65gGbZcU16u+sAyQEmNL1UEPY4ix8aIyKYL75qsoJPMIBZkr+v94UE3XXyBEIMOtoj9hK1p2v62TbAmyfBwQa+mRDsq6YP1q3zc7gtWAsNvZqqKTS5OHN+0+qzZzOyCuKciaRu3cjjOwPUO1450pagQTKGIWC+e6eEQqiiyJoMEc6LQJ3CSz9v8JEIYm4WF9P6UeKO1s5A/BKTV3M9IBGEIwwJsHprLFNXyWJHBNSuml1fc/xckpon3mA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771767539; bh=nuGKrJfrMi07HfkO3RA2XOMKNcVxH2l4yzCK8Jm1XfH=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=i8jtwo06mRrl2fjNkdmPrEzkOhsRAMolJV84KVf5wj47DjYqcNI5Gh8mA5nHfRNGfBn0KF6UsdxTAEJekfAlVMbOEkXP/6Hh7rQpVQoHkrzKH3JDeYshP0dU7z3rYn4KypICA8teyW+cqQhJXw4C6JQo+O1R8cfuE7emkAU1SqEmiwnhDdGa7wiYKAMhbEYasOn+FSrTaZuMRy5xHunLGcBGcY3IAB/n9nHax1RCpn8Q7YnqJ5JIY4xEfnvp5EXE/zM9zPKLwDDwdyZQxtioy8nv4BS2C+FF9SzoasZBURRA7JcVUaghtVeA2X172GJE3sCH++tJZ5N803UUxUpXwA==
X-YMail-OSG: a8HtXW4VM1lJ3j35MB4Od0UD6N7lb6IzF1gSrSDa8WJDLx3S9yot_qN2cpTFYFz
 daC0vTBtg5_BW6CYNi7TmVwpMaH_4niykJzoxYLg95cISEJn0y8kyq9sH1A83jkgxeUnrFYoW1tP
 rNQs5gSCV_ylKhj74dZvLzhNzFG1BbbBFmZxnyQM3TgEvAMuc9ZUGeESUzhJy9kcRYMYX01XwH83
 Ad73j2J2sjVaeppSePFT91W2Iu2PweIpMUPEznLYVoPwjvHV5sipKbm5hzoMqH3Mrp98Q1RDqZEq
 muEFKH4AYMGcVJMJBW_SqllGTavbXE4d5PbmmrMbN79Atsa7CmvvShB5RVgDB6bC0DlEBbJks9PE
 B6WyL1QcnDO45O9KpC3p5f3N9FsAz095YunlPbNl7NQS0Av5e2IniDPTGQZr73JI5TVwm9eTzcWV
 HnJNhCtLCEdATugi9deiYGFMMjDyJ1HP6eenVWyqIRpthQ76a5cOOmgY.ygE9fNi3rqY.md57XQ_
 2tRIMLRMSFTi_6QD5PppKClENZzh5PE2xF2TgroJCeybMdR2JmvTygramtev7.iotIZi5s_t132B
 .TqkDYPc2gP0bSkIz4PekGqqHVgiuD_LqvN4TEZbztOBlk23XeLAnZRb0P8zf3PoEuk.2vD9XWNM
 0DYHBkM9NhFa7CFtZK_jE6EB9gGfvNBQ1t30jp_gme8oezi8xxI6ZaZlnN7IKxXzEUbvLT5S9pFb
 iCmT1TyadvQdDsf9bNX74yUcThzVMG88FJBpw7NZcUg3D0qolz0lQUpYg8D_UHhSw8P5n22s8I0v
 TOijbO2W8tGL_fuE18q66vTQyTMPreb41EynDQrF8xFuf81CwECMn1vecjcmd43bE8CK8dlNxsFS
 7NJvN_jc_PbcAEqaTdCQ1s4aa6gQudKYLL1PK5WHMFsiqHaiqbVaFIwPKiw3duNktZbJSIiAdLZO
 mPSwf_4_yOWa_1C4fqRt9KBUa48AOr8dGwzxe_TCHa4He3UQFtY5fd594d5sZR9jDQ.lOJ7.Dv9D
 zDAqt91MRMJCKVjKmDiS.gJj4cSj8pUVS44YU4wa5P0cWX2W6kFoEe3._I5ipZLsPq5a4mA7oZzz
 p.tiFScxvYRjUt9YPDKHikKmW4uuuOvkWZqj.G8.xjELEjNuN2r9VxhIpOCs2.cev32rzY0mIZO7
 khdmryOt25.OT89awPWaSK7y7TuuLmAjzhHWwTC76jZ_Mfs4DctV6hau4rSMQznnmPX7i.cZ6s9B
 DxZfYBz_mziqmvboTpxlDl1AE4PHXownhQ1IF_fpvydI1RLVASPd357u8uk1wlXOvNsszi600cye
 JkTwb0xaLHtsqNxSIo_uW38KJ6Nu1Ye_pF0qPI20654AEDE9z4HepX6BTFLwQ3XMiQjr56ww7LBO
 Tu1MoQ4b6z6dT0RCfgnUQkoSVQv3JU7I4EwPwrJXDDYIhSYpjmgY1v9dZUnbY6MUIV_PIJEDLZ3B
 5deIvNc_lVmee5tLwW3XUY5UTicbrlXFcDDGgxpY1NAokQUcG.Ue1JcQW2JidVa56eIR88mmv4LQ
 6TkNuo.7B7cKADUU2pAO0LI13iSLIGBf1aM3pW_V_XRdScKIrcwBWriGGJMa9XScGcchixem.bvU
 VBoUUF48thi6d4xcciARJ4GH_Cv_rKiCSxHdiTRnntEU.93Ui2kkXp1AJepbesEzJ.ia9nSNtB2k
 ycvFvh4ffDEeXdX_Uc_F2Qy4GZoxWWT0h3QYK6z1qjTzte87NO9Po9CQUJTETr26efxcxo4A6Zlt
 dOaydeCdM8oxow7.zxGEtkVBYJpVanTqQYOZd0K1W.GWd0hhWvCJJnpreNu8MyA05pAPCtN1JBcc
 4uq9BSV8w_hOWXOs4YRGfm6jBElyJXQL4D_irtk5EugLUsUZPERxGhRAq_0zf2v3eY2zpvUJXByV
 7no4fYe53TZu.m7o0dOXCntRT4Idi3kMFHCzek36uvUAUmBkx5fjupl6R59C6PGXE5.Y_EMNjBuK
 wQSCFPS3czjwk7GgPhR2q_FebqGXa53q1t6KQgRgqN0z__GAe1sFMipnK88vKiXJ39RedkC9H_5B
 sTq6JuZ6w7dNLmXcLevPzm5EFJZX9gdAZHLBjQoc76Rtbw2.JeC4Z_bdn1aRh1.0TboViZQMjAtu
 vArzxBJWwapvEQ1VtMofOqRki.1sA_2T0SmtZREw8VCefFsPoo1oTwyc1OcKDpJwaRsAFfVe1H3X
 krmYlwe5hToEc6A9mNGYUaedZhZHQxcHoBvO62OgpmmEUSJIMq8M23rG2LB7nVeoHK0i6.eaLn22
 KCngA4WD01DYoKyhnnIQSvETOIu1des8c195m6xTRURCtEA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 0d59d50a-998a-4cdc-8912-e334914e4856
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Sun, 22 Feb 2026 13:38:59 +0000
Received: by hermes--production-ir2-bbcfb4457-c2jpm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7ed9610abc9a97f40fa786294b835035;
          Sun, 22 Feb 2026 13:16:41 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: atomisp: Fix spelling mistakes in comments
Date: Sun, 22 Feb 2026 14:16:37 +0100
Message-ID: <20260222131637.115789-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260222131637.115789-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Fix various spelling mistakes found by codespell:
 - aviod => avoid
 - corrent => correct
 - stablization => stabilization
 - addtional => additional
 - facor => factor
 - steams => streams

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 8 ++++----
 drivers/staging/media/atomisp/pci/atomisp_cmd.h          | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 8 ++++----
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.h | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..5e5f3fe1ba7d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -811,7 +811,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 			/* New global dvs 6axis config should be blocked
 			 * here if there's a buffer with per-frame parameters
 			 * pending in CSS frame buffer queue.
-			 * This is to aviod zooming vibration since global
+			 * This is to avoid zooming vibration since global
 			 * parameters take effect immediately while
 			 * per-frame parameters are taken after previous
 			 * buffers in CSS got processed.
@@ -974,7 +974,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	 * to a FIFO, then process the event in the FIFO.
 	 * This will not have issue in single stream mode, but it do have some
 	 * issue in multiple stream case. The issue is that
-	 * ia_css_pipe_dequeue_buffer() will not return the corrent buffer in
+	 * ia_css_pipe_dequeue_buffer() will not return the correct buffer in
 	 * a specific pipe.
 	 *
 	 * This is due to ia_css_pipe_dequeue_buffer() does not take the
@@ -1575,7 +1575,7 @@ int atomisp_set_dis_vector(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 			 struct atomisp_dis_statistics *stats)
@@ -3232,7 +3232,7 @@ int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 }
 
 /*
- * Function to enable/disable video image stablization
+ * Function to enable/disable video image stabilization
  */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 82199dc9284e..d3d1f2574e77 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -153,7 +153,7 @@ int atomisp_bad_pixel(struct atomisp_sub_device *asd, int flag,
 int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 			    struct atomisp_dp_config *config);
 
-/* Function to enable/disable video image stablization */
+/* Function to enable/disable video image stabilization */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..c30501a36f86 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1957,7 +1957,7 @@ static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
 
 /*
  * For CSS2.1, preview pipe could support bayer downscaling, yuv decimation and
- * yuv downscaling, which needs addtional configurations.
+ * yuv downscaling, which needs additional configurations.
  */
 static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 	unsigned int width, unsigned int height,
@@ -2044,7 +2044,7 @@ static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 		}
 	}
 	/*
-	 * calculate YUV Decimation, YUV downscaling facor:
+	 * calculate YUV Decimation, YUV downscaling factor:
 	 * YUV Downscaling factor must not exceed 2.
 	 * YUV Decimation factor could be 2, 4.
 	 */
@@ -2085,7 +2085,7 @@ static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 
 /*
  * For CSS2.1, offline video pipe could support bayer decimation, and
- * yuv downscaling, which needs addtional configurations.
+ * yuv downscaling, which needs additional configurations.
  */
 static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 				       unsigned int width, unsigned int height,
@@ -3002,7 +3002,7 @@ int atomisp_css_get_zoom_factor(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 			     struct atomisp_dis_statistics *stats)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index 75781807544a..5188df4f469c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -40,7 +40,7 @@ enum atomisp_css_stream_state {
 };
 
 /*
- *  Sensor of external ISP can send multiple steams with different mipi data
+ *  Sensor of external ISP can send multiple streams with different mipi data
  * type in the same virtual channel. This information needs to come from the
  * sensor or external ISP
  */
-- 
2.53.0

