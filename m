Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996DF175A88
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781835779; cv=none; b=lVDDRlIbfCrmuTuC95nInlSYH6S7RAdoO9MVBE6U4xPcj3svkoWiHHpUpoljBnqwPSjj6fR0MpKTt541ZhmyaNRtbn2W8iL4ZDr99t12a45zZz1oSkagtGzEaQv/uQTiPSHqM1YvQuluXNpuk+OmQVCQVmjE9KsUGsbRMryJLY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781835779; c=relaxed/simple;
	bh=TeHRFPJB3DNrjhip69zaBk2I2vn7AdrPUrpKoyhetfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TmzFQaIfxfFWWOQ/tuWlfHE/tHhGdTLjLTxXK8ewi1Rh+r88PxrvZ3aYkjFt7Ng3dNBHYJxpZgK/xF6BL2kRGRY/UPd8HFPklWPP7HI1g8j89kWUwAr87zVlKlTSuAwS34k6jviO7EVsVdt78nNW2CU5FwAgIKbioTsdw6ShQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il/VdxXQ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il/VdxXQ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8857a27041so760853a12.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 19:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781835778; x=1782440578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2xrkuqFrx94kpuq+STnKQPDjRSeuVZv+d34ka4mpjM=;
        b=il/VdxXQUOrnHSW/zY7ys1jjo96Vyahh+OeEsJiz4cWhVeXgYVbdjgOXfZs0ZzK6vA
         gKd5KFfT+QOdx6sZGMkFK6+2CNAjN1CkAmNxdvjdWbezA3teaeRtoE8ydziii4njzEvS
         yOqMZqwD0GkDOFfa9HblFoiF/5cDOwy0tF+pVYJw1Wi28EUaCcOCJ9vivBcXPJW0QL7w
         EQNifBaDFkSFGOjCopSlplXm/BfQFyhwLL+Lgy7ckHehK7a7Rx5g8GgWeTDpdjgluslt
         SI+yYpnetO1Kz1snNqKViOHcGRQ9vaFmnn3yW4EogyubGWchwMj61Y2K+Tk/VMHVkfxp
         +B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781835778; x=1782440578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2xrkuqFrx94kpuq+STnKQPDjRSeuVZv+d34ka4mpjM=;
        b=ISkFJTDWbFHx1HHwGitujcbdWHhxON4Tvn0fKzd7Eg66ppeitZxu0n0Co18Uzd16QS
         rwvcVVqGsraNszuPwJEvsicgncWShTALrSc4qLedROzViYCMTcqRiRagtqzeV2gdGPxb
         KELSWIYFt6s9pkqH2l+R6iUS0ED5K2+JtIK1dWkIVmz4j9kgaZjC2odW83GYNPhsPATr
         oYqLzSAE1ixvkMlrx790y3UV75ifz4TcPR1CG4ghojUQ0AQBVde/kbYgdSwPm9x2XC5f
         bsIiFsWCeEXTEY3Cd1Eqs+hdtP4G1NRA4x3URpMs9Sfj22FKArvnwnBnuN10VfMUxjR1
         9c/g==
X-Gm-Message-State: AOJu0YxhtasigDOp4qEMenBBOetRGCyrZVxbWCgzdN/COBOvFD54D/UQ
	QFDFFWjdwzA3bV+f/ineeXDySQgRo8/uy2Jw/NCly+yEl2ldUmxfgfRa
X-Gm-Gg: AfdE7cmLxlF4MKZyO4tKKXqxkHjlYSLHmFlsN1N1+NfHIf1//5Oyn2QoORhaXCkdnMG
	eDNGUfnVxB7MdJt33yVijHRg8xK7m9tba2rDM5GnyV+hgD6oty2lyiqc/13iCAQ+TmfaBtCmNVx
	sq/8rZaEERKEthPditi3m2Cc2AwS1Y3Mywtg6sUkN1Ox6Y7JZ2+A9jTNpRfccOXiHvgFtJ9/d/t
	G+kHU41yfIvwQIA0AK2PNTLOGfT5q/o2+ohupiI1uvykVsvayiSUUob/08FgfzMVj0Uyv05Gzpx
	Vl3w+TIAmER6ioVrPOKNdB2yJwvYMvK1RavsywC3Q3GtGeF2+g5VaJLZ1pfQh/G8kZ5bnWB7++f
	80dZUFJMJeDtrweRH3nHAzUdooTWtr1LDfJ3oOHWrKFIrQW8g7+InkSkT4yTBOu7Uyr3L0xoXkg
	IOqT8sz5dL5Z85E1zHxSagkNVjoWIWaRQbzwR0z+WqR9SCBys8WhcFYb70FHOQuWC4YXyz
X-Received: by 2002:a05:6a21:6e03:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3bb3394bb01mr1838751637.16.1781835777908;
        Thu, 18 Jun 2026 19:22:57 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([2401:4900:c0b0:86df:f75a:8ee6:3dae:31fa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a888e219fsm768539a12.21.2026.06.18.19.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:22:57 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in rtw_cmd.c
Date: Fri, 19 Jun 2026 02:22:08 +0000
Message-Id: <20260619022210.143940-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
References: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace bare use of 'uint' with 'unsigned int' in rtw_joinbss_cmd().
This fixes the following checkpatch.pl warning:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25e..e6054d814 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -672,7 +672,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 {
 	u8 res = _SUCCESS;
-	uint	t_len = 0;
+	unsigned int	t_len = 0;
 	struct wlan_bssid_ex *psecnetwork;
 	struct cmd_obj *pcmd;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-- 
2.34.1

