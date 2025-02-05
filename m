Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A820E007
	for <linux-staging@lists.linux.dev>; Wed,  5 Feb 2025 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794703; cv=none; b=dkjnY9lPj5I7Hsbe9/lD5GJUBOOlS/HmKXPgoCeksIEhDR5nRtP8WHC2vGE9nL69u/xSufIDduOT96c3mlQS6l0kM+zF5SYuAoTUyQXk9YRjg4EMNBt33R0bbXE3sVQQozUo4IB+1/IojFN/AI2YXMs2MoF2A1uuGsE0lZJ577o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794703; c=relaxed/simple;
	bh=/kR10HeCVaYM8Vgq2NDOKfaDPqQ9eCUNGGr0C65gPoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5oHk3l9vl9R4lkXfJphjwmh4xmuZJg4oir4QCogosBO9nQkKXHzga11IVKF+Epz58z1jfHXnY5xiKhYzW1/MOeZA+AUBJctI+OJYD2JLOXLWK1+PGLnaLNYh908zGUFloZ0qabPC7QzZhS/ncM3KgUMoZmWj/pu14l++iImWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxEXGDNZ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxEXGDNZ"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6efe4324f96so3044617b3.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Feb 2025 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794701; x=1739399501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUp96KkPErIjp1gFx51MSdUGxJRFVk8fYcgX7uibo3M=;
        b=hxEXGDNZV1dhacEuYb3akVdqB2ZXQCLUXWJqlKdOnf4uNIyo9JrwTDtzcQNs7tdopI
         aa+eROwdKeS1OY7AiL+56kXTGP6FkWqV9xGSKejChvB0JxWfmKASU5EVBxoQtPsKHsgW
         7tDEku8OesGoZIswDouwL60RgTX9Z8xeKPT51mPLSHI9hLFBIqMH1sIEmzHrmlMbaJqI
         9SQRn15NkLkFU8tio1BxlxBaIocHz4YWdzyHmVlw6Qzyb75B11ILJwRgCI4Y7UJx8M70
         uHb+6biM1MS3DcRjY1i54+qfkd8HwIoMG4QvDDV2jEwFQ71iStVdaVR4y3txnPjitKQU
         MARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794701; x=1739399501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUp96KkPErIjp1gFx51MSdUGxJRFVk8fYcgX7uibo3M=;
        b=oULj98AaNc8N2RW0fgSfqSUMuL6pCMIB/4XXBS9bJDG2WSMLv2yqzmvbDlLOpSQ72O
         bhEFmLVKWEs713DRjEUsq0Vhno9xAW5P28YfBtxiuUXTjXHSnDXjy3XjoviCjH6yXEGW
         D+x9IBspaqAz4XJ19PPaYlHZXG1IlSn4XOv0tbGUE9piA6n2nKoAHcPUxs3N0yt5FtAX
         iPO9k1W/Zuekeltf3uksC4jxJzzEW8cew6ERqsjh/oMG6YEQ+5hg7bzNpaluepePfsnZ
         3tT56IcywwM4JmLMffeRU6Mmh/jkH4wAB2QY/iWgW/eN5TyoLNxwPlCBiBuwN3GOIgOh
         9CJg==
X-Gm-Message-State: AOJu0YzsKgq36W3lN+UqS5RTzphslT6RUY2x0MVpIFqtCqDt70ad22ge
	9xDrMQ2Hm5syjMfrGoL9/l6Wdsoi0J3wPPj+NfbsCLbrC0iJlbQ8
X-Gm-Gg: ASbGnctHMBDo0hU4Ti9Z/ZmodeYN5hR50NUnsEqVl0mKV7hX2ks0z/oUt4T7UeFFwQ4
	7bep0IIPbFK+H1ikCDDoMlFa/Be8xPtAT5vU2m+HQwfmJh79ZVBHKiaye/X9Gom2CkpnP7zqriD
	yYkCxOJhQ/taJ8rAEkICU4sNmtfOd8bsJMwhIrGyfD6ctPfgMTBFhMzo89Y7RIZfI/5uQwzbDtA
	0JgUwoUkiowDR4oLG4KeTIFTcCPa+NnHuU2+VrD/IDPHtjM3jAUlnpkU7EpcVSUiOroEvuScNRF
	lfhClq3UNCoQyP8yUMqY
X-Google-Smtp-Source: AGHT+IG14WsdTTeMN42XPaMB9bsLzPdaQewMB+BTimD7RqH7jKa7+fIz5QE7hDOvceRJnR2xDSmPzw==
X-Received: by 2002:a05:690c:6910:b0:6f9:4bb6:eb4e with SMTP id 00721157ae682-6f989f4a07emr44419597b3.31.1738794700746;
        Wed, 05 Feb 2025 14:31:40 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.22.94.73])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f961d8769esm15469677b3.82.2025.02.05.14.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:31:40 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/3] fix coding style
Date: Wed,  5 Feb 2025 14:31:34 -0800
Message-ID: <cover.1738794631.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed coding style issues. Reported by checkpatch.

Ian To (3):
  staging: rtl8723bs: fix spacing and placement
  staging: rtl8723bs: remove unnecessary parentheses
  staging: rtl8723bs: don't end lines with (

 drivers/staging/rtl8723bs/core/rtw_ap.c | 363 +++++++++---------------
 1 file changed, 128 insertions(+), 235 deletions(-)

-- 
2.45.3

