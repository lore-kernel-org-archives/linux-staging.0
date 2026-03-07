Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC5D2E282B
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892607; cv=none; b=KtZvxnnDKI2nZzZzDgcg2KANAJAl0WfjvvF0onFQODYceuq6vypwS4CKz+jEui07036a+KNNDo/dPOhKTS+6dnvliCmnnX5xFBt8Zk1f9ksLYamsABP1Cib0QWMEfkMuoJ0R2RR1ZpQHKDbPDsGqTbFRCdRsB792hBF6YlE8DlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892607; c=relaxed/simple;
	bh=jmEIE28vWDHD5ckD6Q3lCfUftsjDolrDenAEdgA8KRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kek2W75DrJxZPzRY1jbIoXYcGC4UsQsP45I+7hC5tDF/hTCX/5lfWF0mrc5w9DSPHmNKWturcsxpLbkkD1QdVZjIXbawWwemyoqZrH6jzz/nfE7lh5IDcmBTx1pUHStYzNFYaONlF1S5U7oOpLaHwYcRFGuuJzlI8odlKo1Ww8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfzmnUX9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfzmnUX9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82735a41920so3875741b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892606; x=1773497406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlLqhfSeoTjEi2J59uhJ9PC75EMBz81L4kAgByHwzGM=;
        b=jfzmnUX9ARBpXVXgTPfRfIVbp/yb0dI+kvRc2pE+bEayHSurvCZsmIOatlSS4PBTnA
         y3o5zMXu8v0Z4drnHOPMPUBPlXmCg2zQH+K6nuqqz/WFCeTEv7u9UZDdA9MUEQB+5luh
         0ucQKovKPa2Fh6XnS9ywKZodx31gveUQpaANP7QZp1afRurJJBODTXSOvNMKFIIUtkUj
         cQhTPhf/l2uAPBZMqez1VM0eOT+CBRkoDTbZUnaX3sYtZInELy+WyFWi76EUytfqHxz+
         V5Jya4Skgq4VlZNrvi5plt/dWwkZtB3KSqkQRx9sI0E/BkUe+fOkl8wNpx8DisiEM6rC
         1uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892606; x=1773497406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlLqhfSeoTjEi2J59uhJ9PC75EMBz81L4kAgByHwzGM=;
        b=ElWKE4fYGLCoCD0kUAWWDVQocJpuyWion08Y+pu6V15r4QADa93V3wfZP70GjxNqd6
         NaNmE4lT803KXVK/5DkKlpyjnJGFXT7dcLuN/xwWwyR6Xw+KqYlzwjkZSpauco8pgkx5
         1xjR/PLkUBeXY5y7kSqsXqmwPWv7vEhwOleD1rE++AWsDhLlD9jQ63tmXnwjsixTdgec
         D2rPRh8ai9sFsyu0vC5ZGCbhae8qPzFQ3SxxD9HIkxDl7xaRbeAiZdxwXApzHuI8RJDk
         cg7RShIQhgSCGWvzFJ30xfU1u5yXwLZozdpswyKXsgG68EoKO1kLeOj19GA0TJCq9Lwq
         UsVg==
X-Forwarded-Encrypted: i=1; AJvYcCUzdJWrVOLzc9P6jA8FS0cOsOitNBBy4SdDjYdnK4Tlsr9XBQC6uGKzgkRC425yJP3YR22/T19Oi6NnQCtW@lists.linux.dev
X-Gm-Message-State: AOJu0Yybt1Dr4l+VxXlyEgCn0tPPaawSP9vpkEJONHS9twODN8Y07nf8
	S9kXFiL7ghUhGWVRj/WW4OPgdhH6PlvP3a4Bi17db7eckySGEnPQCeTNw78i3Q==
X-Gm-Gg: ATEYQzxXyKFidzJmY/+kSm+yGqRSTpE0+dBQKeuIrcmTo4bJns3ObLtD+DoF6LGo68c
	ZJl2Mugask9nz+q25jflh9A90Gv7kM26vENQClmMCJaqI+YhNuCNvd22TbOeoIr29G0e+gnEbY8
	RWuGtakushKr+o8WRZB7c3aGV8kiYGAf+qoEsiHcGfCjF0sxjZDa03s7g0apqIz7vOMaia8V2DO
	9OR2iLShbt65paMqfqWTySDePWhC4hBDwaJcXOumyvDMEesVFLggwTQczYw2twa3Jdzjd2YItbe
	bTArulD9umfFldfZ8UwUlDAn9t77m7t6gK6E6dYytiM0ZO45BTrIoHoLh9kNChuAaBuaVAG5zd4
	/C9bmpJtpApx7Rsw3rnMmXlMmA9GqjW4mbGRovnqq6lgOIr0m49jR8ecG6DXkPi8C+FKzubnOqv
	GRZ1Qg9d5u0Kr1pF+nDVurt+2JSKUaiaONOJli60XsgICmEcZ8Vcv+h7YYLdPT94DyFsMqfd7ZD
	HZqBWFIqtezUALC7P+NDQh2
X-Received: by 2002:a05:6a00:2d1e:b0:827:3845:921 with SMTP id d2e1a72fcca58-829a2e16119mr4416008b3a.27.1772892605629;
        Sat, 07 Mar 2026 06:10:05 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm4784965b3a.29.2026.03.07.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:10:05 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Cc: Rachit Dhar <rchtdhr@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] staging: greybus: resolved checkpatch checks for light.c
Date: Sat,  7 Mar 2026 14:09:25 +0000
Message-ID: <20260307140930.1732-3-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260307140930.1732-1-rchtdhr@gmail.com>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added comments to mutex declarations, to resolve the associated checkpatch.pl checks:

CHECK: struct mutex definition without comment
+       struct mutex                    lock;

CHECK: struct mutex definition without comment
+       struct mutex            lights_lock;

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..1391c2b5d5f4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -37,7 +37,7 @@ struct gb_channel {
 	bool				releasing;
 	bool				strobe_state;
 	bool				active;
-	struct mutex			lock;
+	struct mutex			lock; /* protects gb_channel->active */
 };
 
 struct gb_light {
@@ -59,7 +59,7 @@ struct gb_lights {
 	struct gb_connection	*connection;
 	u8			lights_count;
 	struct gb_light		*lights;
-	struct mutex		lights_lock;
+	struct mutex		lights_lock; /* protects gb_lights->lights */
 };
 
 static void gb_lights_channel_free(struct gb_channel *channel);
-- 
2.43.0

