Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430533AD9A
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507705; cv=none; b=mJsnD+DEgKz4iamf6zFKgmoOOqIF487069webKoQ/ZtSyCJuAPi2nuWDHGw/nC8APhKaGXP6Pw+qVr0FW6eyQcbAU1ygVI2fDOAz2ZWY/gqm7VF+G7KKmX86OeALOlIDfFNJ5YWkFiaV28KNBViVZt5quutSQ0bi0R47u8vUvq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507705; c=relaxed/simple;
	bh=Zsln+wkh/kTKdP9tPYhJUmcstMjAjkKkHKICo9+7JYU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q2KbETsapTyIaMGEv5bP9PRrY4KpOhbkVa58yrzTlPY2TEA4NmUicMdnCq/WWEBl9y1dceumUBz7JMY9osHrnEO2QRUqyOm2pjsYYc1TUD6Dygfsd6d1IXj0j8TpZ6zdtg51UpR2cjac/xzVN1mEatFgS22ukLoN4xZSXT2iSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdUkaLxx; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdUkaLxx"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso1025897e87.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 05:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771507702; x=1772112502; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+2AaA9AcBLSwETgyv/I7NUZsmXAYThrsZi9I0+tTqA=;
        b=fdUkaLxxCRHB15OFZcYi/OS1dXA8c2ugWp4xOxKWrBIr49NDCkxXFNP/6kxdAsv3vS
         x3ZadlLcsPRN0VmRaROlYU+1mL2H0xyOZEJcrP0aX6YSvHv13aOJHTcC7AK0R3HfVahO
         nRKB+WvNkoIWqzxcnini9NHBdVLW75v26mWkDFTZo+JHj7N1fV2unHgVMWKHfoXzSOlm
         sHsxU2PShPGUjVFulzmXhndA9Nju305VGj14q9Y9gzZGbjkQcGhbNr4LCF43MTWL9a4v
         fKcMpLzL926WNtNVdqqv6sMDp23czSMWHOrSzWGuswgyoKT243H10PlmPeeK1TUVWCU8
         rUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771507702; x=1772112502;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t+2AaA9AcBLSwETgyv/I7NUZsmXAYThrsZi9I0+tTqA=;
        b=OD1Wke4etalAHLyNzw4GaZdCtZ4B9ho2Le2OcKtbJkRVljEWehB89kmr/W9DQERN4h
         nTUHGm01TTJiTaIrSVlBDaIgdWNX1HetUYb9lkzzZfEQFkFubQjCeNWwE54sbWDFGNpW
         cjO14ZFzXH5MrZXo2/N6ylnzM82nYyzv7/HQJnBf0Mj1gyTfG/Tk57W/IFErnvuPUNoV
         noglpgSSwcvuWViPIsB7Gy6H3gvN7Y7slS1qT2OECmlN0q1RsXjKcvHe62QyQ3C6IhLQ
         lOW0oOekskqoxcHftNvytXVVIJiziPW3Fanb8hceDeQHneftylYZgW4FcI9G7hqmUFII
         Jg7w==
X-Forwarded-Encrypted: i=1; AJvYcCVFxG82gQdBCUKdBJb7wjta5gxbZNtaClp+7VojXZHLz+XD2jT+WxTROZiOIDB/1kVTUtW34rUYKKOQ+eJe@lists.linux.dev
X-Gm-Message-State: AOJu0YzUsQR/c9poAL7BV1udJ1G/NHk18kB6SNMtbmLuDWXmienBMRP4
	vL6x3qOIHs28XNYEVXJ9Vd5EAV5npWE41o8atus6rJEd/0QXteH0+Oo/
X-Gm-Gg: AZuq6aIqoLmR+fmh8Kv5PQ9or7XeK+Ta6DUd0KUXC7+H7OmehM+fwrp1zgpWyg8B55j
	3IZ0Tl6QwXumey5g+33bJ1NN5BRLKDCbJz+F/1eEuBQYtMzCwbO2GyKYbgY9cOFMD0EamwzB4OB
	1hhfX9ouIOMkNeV6NhxFjGxEtAnE8bdFct+fX6WSAHiRfq4wDgmwfM19npaNJO8/OMjUazJuptw
	KYhUsu+sQhVuUS3UdEhLxO9xL6+CdvbWynNP8xqZMbzqg6zC7F+FpbQBmUXLWEJx1U4BTUAYqXw
	9erk4zquAq/xK4D2pprRqsklY3F0btuuSsEKfTexzSrhAMOQk6fGhbceTZllYneD6GVRHtQWU0f
	sljGm2gdr6xnuKgMbILQImnyT2PzUSaZnaPJXslQvGXEzuP7GwRhCGx7UBjg9Hj0IDgN1IPoP55
	5sMQsznpUX6sFyo6MeRaepH6abpnaTzMxodA==
X-Received: by 2002:a05:6512:b8a:b0:59f:69ad:4816 with SMTP id 2adb3069b0e04-59f83bc4cbamr2137804e87.47.1771507702060;
        Thu, 19 Feb 2026 05:28:22 -0800 (PST)
Received: from LT495s ([188.146.32.207])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568bb7sm5379527e87.25.2026.02.19.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:28:21 -0800 (PST)
Date: Thu, 19 Feb 2026 14:28:19 +0100
From: =?utf-8?Q?Bart=C5=82omiej?= Konecki <bartekkonecki97@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: document codec mutex usage
Message-ID: <aZcP88KGUnxDBjTT@LT495s>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Add comments describing lock and register_mutex
in struct gbaudio_codec_info.
The lock protects the codec runtime state and module/DAI lists, while
register_mutex protects hardware registers.
Improve readability and clarify locking semantics.

Signed-off-by: Bartłomiej Konecki <bartekkonecki97@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6be4..90dd3426d4a4 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -70,8 +70,9 @@ struct gbaudio_codec_info {
 	struct list_head module_list;
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
-	struct mutex lock;
+	struct mutex lock;	/* protects codec state and module/DAI lists */
 	struct mutex register_mutex;
+	/* serializes access to codec hardware registers*/
 };
 
 struct gbaudio_widget {
-- 
2.47.3

