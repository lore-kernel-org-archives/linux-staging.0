Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB35236A73
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783866998; cv=pass; b=CadMZ++6gs+W2/7gTO/XlhgFBjyFF3gHi4NsXWCymTTPlWtyXy6oxiP63DeP3fmRTO1qJ+2qbN3Nf+bkXKvsAsKKqE918wTZQHvKWLdrL5tOlPmZIscwaSnfxDjnmf3R10izS9XfTUfnv2zVTvH9dKTgP/xX1mxAKfu6IvYvzIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783866998; c=relaxed/simple;
	bh=tdz3znrtOO/cs1n5p+P83ezz/hUUAWG5Rng4z+Fr+pI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RVPoGk25z7b1fsXYa7HCDrAlqnQZxfdYPj+PTujVTLk5qiGfR9/6l4u1779Ije+nLuxbyvrer9dH0JboF7UbECYq1ssM8GkjLt3e4fCioEcwzeBlyOEL1CQTal1Zl+K9ZNDM0xqstWwKpgCEThahK9IOXgqrfVmEQ0CtgmiMO5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZRAOK9q; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZRAOK9q"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15c257a488so324897766b.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 07:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783866995; cv=none;
        d=google.com; s=arc-20260327;
        b=c9lWFYyN+LfaejL9uAIre/hdyKg0sAXgYJS8idaHLJCkJuxTh/n9Sa8lFv0JDIPGJv
         lr6u4Sw73MjDb57r5Nupbe7UkggAkeAsb90bfpenmNt7Pi5F7q9LYyk9naUG8UxOt3Sv
         SPZ6scI0mne3i4K0Zcc9fnA1Up0hAlH6Ld0dGb3uUq5kxpa3GNW86sGtjmx4JaZQnG7s
         qKYLEcyuFuipdTrbZqrW7ZygVheivm3IcUknFBDDgcFr6njZge0OTGnV+jCLqEBVp9/h
         R0hV2zrNbstRGNgdi8UYDlkFlAXGvkQ4IyvHZKdzsud8QxvTamrbNmkGNgz5H7R1DjUQ
         dhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SWLmEUmeVLAF7U4McoGOO6w/lrKpL5gYsJSGWJgZihc=;
        fh=2lTWXfXeL8nR2xv8wUm6hrYiY/pFMvZvlMlF8hMSbh0=;
        b=Y+lbgTLIKh1+GEk5I+XpUYDhNe3fXilUqsSJ1Hf/cB2znlHv2MVLX3xm3IMHsNurIo
         ut7qcY/RAVLeppQ6rugJOh5NdJc/AW2xWxtWsgy/mUN/73PnKfT6/GIUeivUHVLx98jU
         a3Zlv9EZDUkPSx5NS+DUi7RekbGnbj1fweIW4IbjYwWL4ViEwhZpD92YH+B4FYlTgT6E
         qmwYwKZ6pKQdI1eohmvxsQ7p43+BnTt3knYw4UOg2uUIn1Ls12f79D72UtCHhAHmh2PO
         Mu+bWoZS9yJi3kMA78YVoIyz+PFPqgdBIFy/XylhPvdhvd9hwGcQboM+J8DZpqcLCsWg
         Y7Ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783866995; x=1784471795; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWLmEUmeVLAF7U4McoGOO6w/lrKpL5gYsJSGWJgZihc=;
        b=AZRAOK9q97H8XJ+mcNJ4rphGhOZoYWHl8iOZagJa+EuFRiPJi/hc6axAPw4rcVZpq5
         DTV56PC5KGxQ2VfPEKJ34ENfsvi6oU8v4CiiWjAG/WTeFkZNrKGBJMxOrTM2OnRkXW17
         jTum2TH+GnUCzvT8dhj+sLbkoVhBc/jGglZTK1BQxYWCepeWZJ1Eut1PxhoEUgbuoRw7
         DzUKBUMBA5E097LbxarQweGhLzYzeYNszD/MaCkrqmbs2gK7FSz7sinqM93sb1cc5ddk
         vTkWgQV+thf0wcn+XnmP2FPkKYoznPmodnlNooI7iZv0lvSTt1Kyvbd4CDdBt9aOXTuH
         Oe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866995; x=1784471795;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SWLmEUmeVLAF7U4McoGOO6w/lrKpL5gYsJSGWJgZihc=;
        b=KwQweWaKUpjW/U/7tItHvfQMnNcCLTNuDXan85y1ggnzjaVgewK5dG5IrxXwZRKZR7
         N4sNykR8PV0S4g2T/A8fNrqlLiJk4+GVuRmQHN9g+jzPlwswWENxxRN7KYQ6CIOBtlCv
         2Wr03s5FEty84ZoifzVWaRwc/TRMkT9guzLEZBDeknNeT2c9Su8+k3G6mvEP0kL5541L
         NYxW2ViJed8zF5tHd8pTBZdJH8xA9EMtOdDJpyOZ+PFrSzN2/f/XQ5qoAzfuJwYBIq8d
         tdny25qSGT/5wWsipmdMuK2GDe1XtCdmlhoB9ldQFyq9DuHMY6Cv7jNc19F31m0pNzns
         GQMA==
X-Gm-Message-State: AOJu0YxZv5E286CEt0ZT94jtWBh/g3/UWWreTpvVqsvAiwKaHJWoQW1b
	Eu/cuPGYPJlvktspXWEnhE3+MRjs6DylSG/B3XylZh1YqRap8hIWYzQOQH48tCfQLaUD5oUfDM6
	BvdCrIo1x51lN/sncmeWBYw1hgTXsghJcki6i+lw=
X-Gm-Gg: AfdE7clYk+wlQwndeVeYqZ2/rRTtEceRTh9pl59X2Au+8h1w9RL70mtBjMc/02IyhTw
	S+DNrwxVKGK0rIeMTQLmr++0aorS81xbBjMibRWmMRgL8jzpq90RvN1FH8kCKUSzY/DSR4aIqWh
	mCWb9x/b/482SdJvAmlDGrWgNdt8SyEvLLpNgH5TKz4D8cFnssYvH3cHWiLD8ZevglmtQ7s5zuS
	XcySD+h4g+7KcLHlsA89JOLFai4v10Zzd/wrY1Cgmr9xEKnlq2Jo5GBe2fFAkzXW1DJHx6Xn6Zs
	+UBCF6zSJczOZ2+vH2EfVH/1RakoOVf1rXnZ0wtQ5faQGmROYtE76LNc0hHC5qWZ3Z65RHWCTwj
	x
X-Received: by 2002:a17:906:fd86:b0:c15:fe94:4f38 with SMTP id
 a640c23a62f3a-c161e8b96f3mr225197066b.20.1783866994831; Sun, 12 Jul 2026
 07:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?0JDRgNGB0LXQvdC40Lkg0J/QsNGJ0LXQvdC60L4=?= <ulijg308@gmail.com>
Date: Sun, 12 Jul 2026 21:36:23 +0700
X-Gm-Features: AVVi8CfTWlhYbzss38vmOs-j9c2lft0QiWJebGnUeZ_rGY6CIaNII8rRdY99xUg
Message-ID: <CALVCEwaGkq5eHDusXP=J60U3FUnRpuYVhZcQX4_SB+c=PahH_A@mail.gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove redundant chip version wrapper
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From 0b6e126168b8c90bd68604b251750e07338c6845 Mon Sep 17 00:00:00 2001
From: Arsenii Pashchenko <ulijg308@gmail.com>
Date: Sun, 12 Jul 2026 21:31:49 +0700
Subject: [PATCH 2/2] staging: rtl8723bs: remove redundant chip version
 wrapper

Remove the redundant internal helper __rtl8723b_read_chip_version()
by merging its body directly into rtl8723b_read_chip_version().

This eliminates unnecessary functional overhead and simplifies the hardware
initialization code path.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index d7f9e3119..a364f4507 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -820,7 +820,7 @@ void Hal_ReadEFuse(
  hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }

-static void __rtl8723b_read_chip_version(struct adapter *padapter)
+void rtl8723b_read_chip_version(struct adapter *padapter)
 {
  u32 value32;
  struct hal_com_data *pHalData;
@@ -843,10 +843,6 @@ static void __rtl8723b_read_chip_version(struct
adapter *padapter)
  pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ?
RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
 }

-void rtl8723b_read_chip_version(struct adapter *padapter)
-{
- __rtl8723b_read_chip_version(padapter);
-}

 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
-- 
2.55.0
