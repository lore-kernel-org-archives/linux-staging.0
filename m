Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875B2D7DD4
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155020; cv=none; b=nguS44jAN+5g34dwCs7+JpjVtoIZeFlpGUHjRR0lkFrRhPkrE7wTkAiWjoF4gMT+cEHZCCCi1xGl2f1oedjHGmW0H+l2JD6rrL/15BI7oDe1SITOby89AFevNvsizBeAuw86RdFUVKC+5VWdd6CeU1WH84ezZSfDHxX1JP8HSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155020; c=relaxed/simple;
	bh=cSSx7yxC9P/o3KE9SpCvoPLsSjEbakpZEXS+NULRhAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grXXDY2xdbngk1u4+F+5+6wh2yDPEqZ+9iqSZsJeGtqbcaIA1kd/UbrFNX7XHLD8JyYFcjEAEN96efdWCVWQ7g5Q1CNIYRiNZqRumckYZwbOrefieVk/DtW8Mp+VINIrGCxY5m02OFAIoPIFq4qj/qSAB1GvbStK1RvNBbV9J6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoVjxB9n; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoVjxB9n"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a12c19affeso6960516e87.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773155018; x=1773759818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+vC+hK6+CJjzXWl6zvotc+qQlzZ/n3VEaRMJZOvmv4=;
        b=DoVjxB9nJ6+1Tf1GPM0Zg59rogPTyjvx3ahrfrvkkkv1TO/I39+7jV3p2wTg8KsL3h
         /PAuZ4Y2/Ht9giAEX2dFmxGfJxbaCc/DmTzkRsYP5EkOC9x+v2VBvjr8SI7JF+XMokX/
         w1YEwF9IYOJJhzdS3grWkUMcvxSKfyEhDQf1YSNJiOJREj2ggZAgL+GqwwZVeSTo7IVw
         bZWZuI4MgRMKUk7LWnAfB/6bqIHrTb5Ct3PkfWHWG74YmyWMglfBhHEPomhWcAuodgSW
         Ms5fRT52IEmflLvnNNvOBS8RLIHuApixb0exJypn2Rdthr7Mck4vj6FCPlvpA73IXnU7
         JexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155018; x=1773759818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+vC+hK6+CJjzXWl6zvotc+qQlzZ/n3VEaRMJZOvmv4=;
        b=tfCWcCiEoOYoBf4E0h/N1AbBlqeqcTG3fJCqL/wHsnISV2hJBSmxl/WRBLmZdjfcMa
         t52rCXJuQvJbQqvAByiYcrd9P52JirOW4JKSt6vsuoGJyHckSs8l6xy6J6JHL6E7m4Dn
         pERERs+yLajU/fUXr7iuFfa7YjxbigYWEzl4u3YtA6HQz76apXZIdEyoF2X0zgqcAOYX
         r4oNRAOdOP+N2Rs+BEhqNBmqXZ1YQ4By4nsyP0P9Mib3vY0qtAVDhs/Ea6vFOZ1llXvC
         j0ZBZR/Xvj1chz7wSQIfVB+l6EEQdbscJiW7scz2fk0uz7wVjfPxBW8w1K7DPiBL6j3h
         G3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO+3qGUCicrurfVkWM5TTwUnwqW2uuaFx4OjI7u3RV6H0Z+GYckTXWRmd0UDJRL8P11eUBWaJbtn8Q7Qh8@lists.linux.dev
X-Gm-Message-State: AOJu0YySLF69p+pLda4rl+KT7Cu8VMx+ZaOBEW4jIhjycIlosZxvr0q5
	+oMYjTWBE4kHCmd23/ZzQOXWDjXQGWUmC6c6bM64dHT7S/JsnVyJRHKk
X-Gm-Gg: ATEYQzys9yH/+rEmOq+nxKJQBaH9LM54VcoSXWXSo2vE4QQp1HFu8ucaD97t5p43wXI
	LcApJ7wnpTOJ6nH8l7I9YVokI2t+/FPJEgTNx95M7gJs+6vZyKpneafrqGCmgzHSPBgDIz6EoyJ
	IRZCI/0n4lSv92/7jUVa5KsDm58S826zepRcviiqXwD6euIk9U3TGscemPrhUDmqKuSHZEoZ4Pr
	rLkPg9SX7WBMPz6S5TWabr6323yx5pT65G3ZyTTXTKEEGmO7Q8wSWhGfn2LkfxsaNxPYAUqZyqt
	dcoE0BRp9Js7k9wMTAn2osHrtnS+Yfs8jCpgiLANPMHy3WLbv0XPJQbGGcBlKcoei59a+xFtkKu
	0osw1MZ+dRiwh01lZAmjOr7FQbN3HGEbU7rkiPKCIbGvCStGZm+6vPAjWqU2BbWu5pLH8Bry0YD
	vxlIsJuEJlKLAX19vQr0VTy7K4h9ZUWoww4xfUcJj+qU0jUvFpYiU+K6pZY85s7D7/6N0b5uWzQ
	Js=
X-Received: by 2002:a05:6512:154c:20b0:5a0:ecb2:c0c2 with SMTP id 2adb3069b0e04-5a14e4691cdmr1068579e87.4.1773155016814;
        Tue, 10 Mar 2026 08:03:36 -0700 (PDT)
Received: from T6NXCV08J99224A.admin.jenseneducation.se ([185.154.228.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0a3sm2819033e87.49.2026.03.10.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:03:35 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: replace msleep() with fsleep() in atomisp-gc2235.c
Date: Tue, 10 Mar 2026 16:03:14 +0100
Message-ID: <20260310150314.565-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309231445.7000-1-rayfraytech@gmail.com>
References: <20260309231445.7000-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(5) with fsleep(5000) to avoid sleeping longer than
necessary. msleep() with values less than 20ms may sleep for up to
20ms due to timer granularity. fsleep() selects the appropriate sleep
function automatically.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..7999c8595a68 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	fsleep(5000);
 	return 0;
 
 fail_clk:
-- 
2.43.0

