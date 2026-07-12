Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771DF352C35
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783840263; cv=pass; b=hDQJR1Eqen1AsDy3M4eP3uLacitTLhUDhKcbdX9/hQywIbUvZ6cnia9cjUGP3cvcfir3Q5Cjp5x9fYlcM2HT/phYOeOI834fFqrDbJVYZqyekQBOymy9hkbuYOZC2RRSe7kr2dTSIvddApXOViAbsh4uKR0zQuvugZqQ2x/+0LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783840263; c=relaxed/simple;
	bh=T+w/ffiiK7OlmwALOJ4ugbkNYxWyS9Xo/XgrKKZuSmY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bqpWXza7PEDlkR68p4R+hSI1Ua8UReSFIu9iRWEii0+vDgj1gE6VoXk/XLPqyPezxQFnMKRKaCmi+auY4bai5jLKGa6e3yOPD7iKxwNUSf/uk4ce7EK74XcbiS51dJhwNMpT0TeFVTg5Af3iwHWNVvM1wyjJXl9QZwVMipVFtdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rj1Ap6Ze; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rj1Ap6Ze"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1601d552a8so202563666b.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 00:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783840260; cv=none;
        d=google.com; s=arc-20260327;
        b=sTMWFugjuZNPmmGtXrqvoCgMD+pwh8aYFdbtvSjLaX/f8RhXL376b/zciZ55uIK3Ah
         GDT55zuwokNajcV9+JD1BS6x0OxiJ3AgpzNqcEqHDB5oNoIyxF0uJQsX6j37bj9/y3qv
         ruPQ5Cpvibcd59hX4ckcHH3cij/mLfDhrJlnDBz8BTFpv5Zzf18y4CsKBlQxyWr/ghOt
         jZ7JMxcajSqW3x5kQ9z/vPLWvRO4yIsel/6/clhPwvTc6la8QYD2KaIZ7J6GDFjgF1CQ
         JDqZnP9OsTWvMgIH3tGeUiffnHkRMPZn6YmzQkUglkZq23HSefta+RxcpT7vQkjYF4TQ
         qHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TOT7SS4XbWizkXrbmfUMFemU7bdmBf2tHHu8gjjy2Sg=;
        fh=2lTWXfXeL8nR2xv8wUm6hrYiY/pFMvZvlMlF8hMSbh0=;
        b=Lry9SkEvm5PETIbrq6zPq665N0yk0ZWEqXBQpkPPyV036g/TEndiMCqRzSfIgxUowJ
         HUN+t2Ee8fgLnBqAkGbUX+a1ueS7MZUfYanVf6X10vtBEo4r0j2uVn4VGTCMMaeVlaDE
         g8rVDiblFaltistbq9vSn9YcauBHvsrwebmNJs/6BjxZe5VdAjrOnFsM//v8S9nTpZ1Y
         JvWZia9g0uN2TuZDDID/f+C5W0VO214tG3qXR9mN66awOrN80XxJxjzJn7yLC0l86Mw6
         AzuW1j4S2u3HsnOzyvNLIKSxGUiH/ismchSXQWIffwnVanasyPJkORv5ZUpAZBVwm9h4
         9vOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783840260; x=1784445060; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TOT7SS4XbWizkXrbmfUMFemU7bdmBf2tHHu8gjjy2Sg=;
        b=Rj1Ap6Ze9z9sIxA40yWbIxlsNBN2E4SVgt6+BAfxcMqHZ1K5PI9XmihQDnRYUWZluC
         M9AKCGCfzkVAR9btlgSP6tW+ab4G786Sb9VZbX3ItigBCxiW2Tk72QNAhaXw9M4ZExcg
         8Ig2BncbCqr4dhXCzuUklBQdb0ZuJcFURxWKc1mu2I001mgYrwOHR1gmSy/SxTHS6pdm
         2Xw/h6SwUnPN1Sp/fXZXCzIHcjbijvSpzHwg6w838D/01Wv1VVJlaqijgI+1HqzLpFak
         XWZxZxsmdMqYonBVfQmvniyLvApIdlQE13Gt/io80+3lfXZ6irkK6d24K1UBvBVua8U4
         QKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783840260; x=1784445060;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TOT7SS4XbWizkXrbmfUMFemU7bdmBf2tHHu8gjjy2Sg=;
        b=qzcWTfsqD0SbvioPGgC8tSIR2X++3EhqlGdSnj7wZAo3rZG2TM7KtBv3gQRB1f54Kn
         omN7lRn9sinrBtlF9yK02SyDV68vdsx/cdQSTTy3avX2j0bHQh4CSbnE5ZOHfIpSGzDo
         kAv3aPPtjgfQ0uqSMR1M8n07P5saU9fanILPzHU89uyqThOnEYy3C9e2YKaz8SA1kLEz
         gCNbXsZu6Zxhn2Znvd9hIvvw+cE8qTsAZaoDPTszwZeU2Ct50kdrbVN8H8yUyFMacLZ/
         2HHvxntZBFdsM6BiDYR5tHT1HrektQCo/eN8uq2rEcMOuheRSL9MUr6Gk4foJqz/6dbK
         5KZw==
X-Gm-Message-State: AOJu0YzUpzfqBH4IDwz7hAI+B6EppPdlZEqYxMAB3iDscfRlQQ28rJqn
	s7rWmK0K4ZeZRLTunJZ+zK0Vq8joQb53/iMZmkN+ccaHyDsO+aJSWh8xkjbITaKDd7e5YMQGEc9
	CDKSFYep9qVpJqgXAc/GeqcaoZLf639WZ4smnq6eURg==
X-Gm-Gg: AfdE7cmAT3ijD9lW3cvEspHPtfKoRTdEiqP1CWbgo1tcNCKPzBoyjZp+z0Ld8Mpc6Jy
	dxSFWQH/f+wcXB0Cp/+JZZJAodPh5qybsDisj/QWwVoxS2sowI4o/4gvlXyXCGNOmgI9RQfc6oL
	NHRtqeSzPGX8nMdSXOjR2UTLKng3yCAiSmsI2tlMuG4sKltPDI+XwXw+oeg3WRlp5F2XDsi40ut
	uXGEQFSV9NDOi3NEfgnA/AeFAgl8y/upvVffo39FucRd//0BssFKS1bxPFmZdPUNuEOfqmEhpbo
	4ZSmg11z5RAVAyHXtbBxr/Dn27F4wHYKK41GGYPV2Js9BRdsF3CAPnO5rwEsJhmtC/a8zcOTnYP
	n
X-Received: by 2002:a17:906:ca8a:b0:c15:dd3d:c6e1 with SMTP id
 a640c23a62f3a-c161eb9ee25mr131632066b.37.1783840259755; Sun, 12 Jul 2026
 00:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?0JDRgNGB0LXQvdC40Lkg0J/QsNGJ0LXQvdC60L4=?= <ulijg308@gmail.com>
Date: Sun, 12 Jul 2026 14:10:48 +0700
X-Gm-Features: AVVi8CeuJjbl_X6FytqDB_NzauB-i9p3Q2jsnrqqepEQkgy3O7ryRYO4HvBCI-s
Message-ID: <CALVCEwY0Do4u7jY6kvZs6=SVbdTCnf35FioYCxtNVZvMfv1D0w@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: unpack magic number in REG_TBTT_PROHIBIT
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From 5475ff511250d5f4bdcc71ffdad52d0d89bce08f Mon Sep 17 00:00:00 2001
From: Arsenii Pashchenko <ulijg308@gmail.com>
Date: Sun, 12 Jul 2026 13:58:05 +0700
Subject: [PATCH] staging: rtl8723bs: unpack magic number in REG_TBTT_PROHIBIT

Remove the monolithic magic number 0x6404 from rtw_write16 and
unpack it into its logical components: 0x04 and 0x64 shifted by 8.

This change aligns the legacy driver logic with the modern rtw88
driver, where 0x04 corresponds to WLAN_TBTT_PROHIBIT and 0x64
corresponds to WLAN_TBTT_HOLD_TIME (shifted by
BIT_SHIFT_TBTT_HOLD_TIME_AP).

This improves code readability, keeps the hardware logic identical,
and fulfills the internal TODO comment.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 8 ++++++--
1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b28..1b8ae3d57 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -861,8 +861,12 @@ void rtl8723b_InitBeaconParameters(struct adapter
*padapter)
rtw_write16(padapter, REG_BCN_CTRL, val16);
- /* TODO: Remove these magic number */
- rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/* ms */
+ /* Unpack magic number 0x6404. Matches rtw88 logic:
+ * 0x04 is WLAN_TBTT_PROHIBIT
+ * 0x64 is WLAN_TBTT_HOLD_TIME (shifted by BIT_SHIFT_TBTT_HOLD_TIME_AP)
+ * Combined they form WLAN_TBTT_TIME.
+ */
+ rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x04 | (0x64 << 8));
/* Firmware will control REG_DRVERLYINT when power saving is enable, */
/* so don't set this register on STA mode. */
if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
-- 
2.55.0
