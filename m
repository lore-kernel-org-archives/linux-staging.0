Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03030F816
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384363; cv=none; b=SD7OO9EsCWhFmtYBl7rLDlGRXXbclGsCn0j/fEJMBf2u8r7fHrbs/Pq16d5rufO1Nack0tlHkcr2gBE+6G0R+ag7HV8P6vRTFajvilvwBxhra4YIUaocjO+ofSU2MjSapvCaDU/g6Hah923im8k/qD2U69HX8T76YeznlJnZlu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384363; c=relaxed/simple;
	bh=QYbm7Kq0P+lDQ4OXGzb+yWcVuThB7esv0y2SaqAHAjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRcxQYqDQr8Lf7yuCcvw5+f4npDA/egproYtFjo6gdPsjQNa/ObZV594toiKMSWBnzUqA2g6k86gTUKCv0CklVQoHsT5BxWGHt0RrWNEJMpizleOhJBxaMlmhksDlLulOHWYChL0H9VeonkoyfGHTFK8ntygXK502TCbeyO0IPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WE/AzKc7; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WE/AzKc7"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3087167eec.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384362; x=1782989162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=WE/AzKc7vbKOVpWQfb2GFroXbHvP1lWG3EbUUhKNulpWvgvNtaPXsLAGazYOspLN5W
         9EsdrnsDMn6GrNeFKU3kTuUONemietLonVio7bMenTL5Fzb/VVxe1lHTrzb3ZUa5oKxp
         Vi6yc3gIn88+pjkboq2CWrp28Ipy8ivNBySj1Rjqof9RUwIVf5GGi0zB3W4Cg2F22LiW
         i47fkoQ+cgqEaEGH0FEVdp9ircOWn7bBSTdeFDfNa0flkcE4D09UUAjntpZ2Kvn6VLrK
         DRAuzBbF7zgS0Hw/Om3ZRdXGZEeAJoC7YAwA4KC8DR67omdnNlU+tL1dVGS4huLUy5sM
         FqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384362; x=1782989162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=fNscjjCL2ef+cOjAhzTXCtoePm7qqKTRoW4xuKLSfjfw/JfVCBvHcqz8co1r+SBCBR
         fU9eJfBWiFnPxVop0o3r+/t+whEFACmdawFmCG2Ul2+x/czL16ZRI3DykW2jyFAataUR
         xUc3uIbL7VK4PeSuL01E3mV36Ap1mTx4sufluQnBXdVDU7pK0sYz20vH5GFtWS8J8caa
         Ij9pirK4kJyYcuPiM9MU24yYrnsXnRjPBUTvgXPvbYltl22nhOnogm3tVuFsjt85YOvR
         W9zmHxX3K7fOMH/AiONvwwCnZC5PwHK9LyFUiCl5ebU927z4BD49BMRMlvIjPdiJo4Zu
         HT0Q==
X-Forwarded-Encrypted: i=1; AHgh+Roual7vWWLXqlxMz/HP89PI8enk/JyQ8FNiIXuDY3ad+9KVsZGsF52YV3CIYTWXjzGwdGfVwV4UW80WkWo1@lists.linux.dev
X-Gm-Message-State: AOJu0YzOWACqLVO256oqx21dEcl6eUBJs9xrQmsTwHuDeSZTj3cRLEU3
	yIHW91H9dGCI4LlAglEg7tfDNW9Ecwb+rhD5FbNq8wQT4zMyHCUMYACE
X-Gm-Gg: AfdE7ckunwkGN0zm/3ioJWdrdjV32x9iXEdYsqFCJbOu97okB8zIadi3vNwWrYU8RGx
	VqxgNP0VJpaZ8YpHAlFQZPRqvGlheBwggj2pDKXHHEVM51LVPjgPL5i1BEjlrv4ERLvYxgHJnjY
	WqEw5DcL+e6G0fB4HAnVmdzCq9PeLVsR6lGBvwq5uYhzbUcZK8dJkaV+hx1s7b+coJnZPWsSDtD
	GE9HrKZJ5nUyjYdt+vObM9WgAzt39UC08umPxGodb3FV0l53C6csVjU5lAw7e7kVQHWaaYdvWqx
	3QsuInpE6rpuaVjJLAOjmnuYy/snafqb23YhLzLZrS2hrqORvVFzEkddxzQYLNMccrwasjp1g1b
	0A6Ii9iUwo0nOxLULt43rHIR7RH3XcY6PM4o2s54fmhHI785DUCwzO1uNQst7cLvIVtvzW7Qn6o
	iGXVaCN+riYj+U/aBokZH6OSDjSBxynhWHdA==
X-Received: by 2002:a05:7300:e410:b0:30c:25fb:d28f with SMTP id 5a478bee46e88-30c84d81ba5mr2150281eec.25.1782384361612;
        Thu, 25 Jun 2026 03:46:01 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c8c02a2a2sm4116511eec.2.2026.06.25.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:01 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: error27@gmail.com
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH v2] staging: greybus: add comments to mutex declarations
Date: Thu, 25 Jun 2026 18:45:20 +0800
Message-ID: <20260625104520.288129-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aj0CZOUlYlJydfPd@stanley.mountain>
References: <aj0CZOUlYlJydfPd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments to mutex members in gbaudio_codec_info struct
to describe what each mutex protects, as recommended by checkpatch.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..326770b99 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -70,8 +70,8 @@ struct gbaudio_codec_info {
 	struct list_head module_list;
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
-	struct mutex lock;
-	struct mutex register_mutex;
+	struct mutex lock; /* protects module_list and dai_list */
+	struct mutex register_mutex; /* protects module registration */
 };
 
 struct gbaudio_widget {
-- 
2.47.3

