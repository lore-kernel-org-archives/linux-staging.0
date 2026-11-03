Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743929;
	b=ttR2qRkvZ0eHTTuUQyBnyWj3ppMNrdr0z80D/pZh9LZ0M3w5BIG+gMC0l4EMiU7Hpj9Y
	 oARZBEXKcn+YQ4GD+tklWtbRNYCSiwJLSSrEtibNxLOVb28IuREz25iU8ENUn4RgVXWyl
	 yEU9fukJYkSb0Aby7/mZ/+t8Pkyn3EeGS8D+WFDbOAhvUe8BOc6ocYA0bVidMy/x4zTwx
	 mRO8naA0O6lJVqer5biOL4Jv5AI5Pf94FT22doqKWwLkzc/ATFXS3eu8O3zjOrI6WN3R+
	 Ol8DdjTxE4VfwWEmOjTCP3Iewn1X6UBp8YXevB1EE7GZybE6QNsIDQUEDmkE6fsshgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zhleLxlgO/8KkinCeUWj94TJDi+jMt0bo+ONkONjbbs=;
	b=msHWhAiQocyEpt97sYuWonR3JCI4CQKk/SBbOEDp2h1qWM0HnyXUu4+3vePOR9YdcZAD
	 u1Ku7NHAaN3w03ULWmzyokz1ZfpZdCFRkXsMQJjozaTJR9VgbXBlUgKW1ecQ6AJVcCIzt
	 d7UEV7K3kmw6OhGPg3tTzbPXyXVor3kz3V+vb8E6LAu0vqYPTvXOL0RnQlHG/pEgYJ75W
	 1IeU8yjUH+Kqn4E6/mKIOorD5IKKCiPrtu3LKPNB7kRq3W9O7S+/4u6NQ0SR2iuUN/Qe/
	 5dDy7uh35iTf9w/iHzOKJQSTk82mRnJX+sDFbvogRBm5P4iqDYSA/TdJ+2mMdCjNzXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBxP32qv;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60602606A331
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 22:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60602606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBxP32qv
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e515769d3so10656985a.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 14:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743927; x=1794348727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhleLxlgO/8KkinCeUWj94TJDi+jMt0bo+ONkONjbbs=;
        b=pBxP32qv2SDqXSbwKq5zeVpQ7x/is9u7xC2MolREXbPUBW3wzamfe/BSWULc2kqrYj
         dKrhMYoqGN86nrrbpRueqnYkqYxG0vt+g7X0FJ7sH90nZstyPdCXYQYqA1w9R0zegHhh
         ad+BxEbqYsXxSfXO8vamywUhAAWUHaMEndXzDsubUndaLFFL2CNKhYLknRZGyha2V69J
         ilDVBICe/iZfW+oUjumvNAu6zfaImsorN4yqSwrlwxhxq3hQEsnmEygA/xUb79jwswhm
         giobACF07ThM45jG4DEZdRWN5Vr8xzGaXq15tzuGIw7voSeQIXjhNZSNOKkKqT2caolK
         k4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743927; x=1794348727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhleLxlgO/8KkinCeUWj94TJDi+jMt0bo+ONkONjbbs=;
        b=Ajq3IlJzUTegfkftX/Pr+cwSQrAG5WLxLcKiIfpGFiu8J88hG/fMv8/0DBXcBOuDhy
         UZMoqg2zXIraMZujHPxaXZcpCUsLB+8GVK+NRF9xBhq/q+npVjbVtnwIUyqITXLklzUX
         sH+/VS10hgdY0vrq4VFM6dfbb9m7l6AQyulHg97tcqEMjepdUifYjcE48xUyXyJpeGQt
         b/JaLphmQA6dluKoVYZNCtGC8jOV2DvinjH/wgKbmk6kVmK4P2PRCWQ6hp5v1uicLb6+
         bWcnrAFwgUOkUzbmECK3J75/mD4TLBci3Qzvhj5GQzF2DFoN6EEwDWL/5Q161vx96JAP
         8JtA==
X-Gm-Message-State: APuU4Z/v78m9VJvbhZ9fU+KKjPG9cdcMc2nwLGpYjN/Nm4BRmBcqqnU7
	1P0Bt1wiJ/61iUXzGeiuZZjyalLjECS2AoVA41NGJfokkrsNYFlNPjl4
X-Gm-Gg: AYBFou1ZJy4J+ed2ZWy4yPpxyXYgACRdziCyMhCcGPjQ2KTOkHC8Pah2rbqOL+JQ8wF
	M9yB8VkrcZ5mOGDaOhm/WMyBk6OIvVbKUkj664I63Ou4fmCTiS1pqbBkFBLevpSPovxSUYkfz2j
	y/h6E7nEr+ALaa/4j/9ui2RI9CFE958DDyK0HSGfzYooCSJZXvIxMe7PEa7fq6CkKYFN1+YqX/6
	rjBP/Mx2kSO1SuPV6BDw67CS8GAnrNWPfyZ4MFi+7B6B5NG3jKOJHm9q1WpC48KAZAwKwR0eCDI
	THGzPkozng8aPy4gXms6vv8mG+EXLHTVGOTzW6fChSNYb8onlqWqP7yb++QqVVjVWjB/7/eDJZs
	/rLpZVpQXfM5HAS7NnUWWwFzveo0h04YDA7ZnvIEfIaiFPKvrpkJaR+wqVDPvigA70CLNAHjjvW
	F3O8HabVCqhIdHvO7LaRltYfnCnDTShzSGiQni+/GyEjyxNzy8dFXKjEJZ/dJPffWIfOwOu0nij
	tyCaj4Wdhqmbk7uTfRck2UY0pQ9noaoEoO49PFnySHruf4PCy/6xwolZXhIhSlzt/8fjRuFbTM8
	49lxa00rH8Y+BhjP/in5vUyk1LSs1P5rex7UFQfKd/Q6rt/K+XQvusANGdnLhRMf2IcHT3tlZu1
	whl9j8OgD13PP2g9P6W7Yaq1ht7dQ+h1C2GE=
X-Received: by 2002:a05:620a:2805:b0:93b:d79a:c463 with SMTP id af79cd13be357-944216db682mr2344562985a.59.1793743927168;
        Tue, 03 Nov 2026 14:12:07 -0800 (PST)
Received: from codespaces-be20d5.ynsnsb35uh3ubhr4tvarlepncd.bx.internal.cloudapp.net ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4844be4sm39276485a.29.2026.11.03.14.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:12:06 -0800 (PST)
From: Eileen Blessing Kabi <kabiblessing5@gmail.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eileen Blessing Kabi <kabiblessing5@gmail.com>
Subject: [PATCH] staging: fbtft: fix spelling mistake "writte" -> "written"
Date: Tue,  3 Nov 2026 22:11:41 +0000
Message-ID: <20261103221142.45100-1-kabiblessing5@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the spelling of "written" in the write_vmem() kernel-doc comment.

Found with codespell.

Signed-off-by: Eileen Blessing Kabi <kabiblessing5@gmail.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a15414..c4db681eb 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -221,7 +221,7 @@ static int init_display(struct fbtft_par *par)
  * write_vmem() - write data to display.
  * @par: FBTFT parameter object.
  * @offset: offset from screen_buffer.
- * @len: the length of data to be writte.
+ * @len: the length of data to be written.
  *
  * Return: 0 on success, or a negative error code otherwise.
  */
-- 
2.56.0

