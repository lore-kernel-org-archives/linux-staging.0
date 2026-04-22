Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A443F9FB
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862102; cv=none; b=SMx3SF7tidA16UgbkskEzU4nXFZWtZI8cb13FSvJR04epZzRFqLTOv4DbJf1iCPXT2HnyMzsHu0yHbTi0EA4CreOo61hYAneUMGR6/McP9IsUWgbm1tpjYiYTbWwTP3PSBQCqVrFVgWnBG7K2UribQ9syFDAduSNY3nzuhS4+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862102; c=relaxed/simple;
	bh=ZaPvoBmoWaC+tuABBrtJ1ZTMUmTsQUEkbKx5pr/GKXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W62CnRty9txNjXiO0ke5/yCaE0XDHlQH/60yP47hUiaOwo6osKOoWTFpU792C4bniscyGaBxepckLYaOWDejs9TM5uXkejovL2b0nyYNQnMa5oK3jIjjhGdwbzE+gmPSINC5OVEvmZ06q2bxRISSzat1mMpMyKaI2TjUcuv56BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ0TN7Vs; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ0TN7Vs"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c79467f11abso3531737a12.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776862101; x=1777466901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaPvoBmoWaC+tuABBrtJ1ZTMUmTsQUEkbKx5pr/GKXk=;
        b=lZ0TN7VskP869wmDLoD5dnSGOSflAejfQtap5oSX2GyOJmaUkFYru2ZrE4zgjFmSBQ
         bNv3TwJzzbT4druScvoIIFce8xpLEOFAdSVZJoc7c9YnOUWpEjhDpuWwr7EtWsRUAmE5
         HhsBzXrHCt7CAE9/JLbLgaXYJm/jHQ0XF7QnDM3LvYxlNYyZARtiGqIbMvw1gV2ChUjc
         sUCELiPB7hp/7iMSp04j5UPBDDr5aBiXSx9EqxTwREv4EIUsU75aul3oZqgw+JHf133F
         FBwWw1QN3eoKAQWrTZjGn3Zbgmr3PMTjd4kxSF0+dcgVylD5pcNC10Zd6XPK+DU9CLZU
         OUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776862101; x=1777466901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZaPvoBmoWaC+tuABBrtJ1ZTMUmTsQUEkbKx5pr/GKXk=;
        b=Oh8E/1slzFFYezRwlGXGQtsixyQaSMEDY4TER0fZzehPzoLIGyUBTeVp79IZ1HVZob
         JlpL9kMKBkb47YANDO5zEp1NqSAY93ih71ULlpEIn2XSpjHmVXZCONYyVbjL1RleE41J
         8jXBkc+3WKV5ldoRpsmiw2jYXfGnGnekQRKfDqxVmy1fN3iCJE7VbT0vz0uuEXAkWTbR
         pv+i142UA99K5IeVXaz3TIrtMuU4pq/dht5V5V46xRPBGtAxeRDfiZetiJFLazYqMJBS
         BQbOOjqyVvY2FpBc2wBX9QxdD+EdgLu46PDD1nv9QuqNr3o7lg1FZ7LHT2KNATy7fb2I
         CH2A==
X-Forwarded-Encrypted: i=1; AFNElJ8+0hXWp7GCjA0OsHXppDD60kmLwdV3ZuWy2YxPIyMR7j5gl5HRKplfWlhRQGRKDSacgEYesBoTzWDECsdI@lists.linux.dev
X-Gm-Message-State: AOJu0YxLBqCLWVmS0zIIVfiH/0jJVDy8jp0tGNxl5g7Iq+x268PWnbxT
	pONnQqg0Q42jevDbNJB0FNFmZjEQuz2n8yJQMg86rZvvWTU8pTsDo/it
X-Gm-Gg: AeBDievzfU22c79y+ijhD+RGb7IIYhrS8jem1B765lYd7Ec0PcbW9B8yzFRgz+eAffo
	5Wak0hCzab2PHEmEfXqkNd6aLljJn4S3OfN2kMYHLJWKZTU6XZgJq7QWg8HzmfhNzMECosMxlTZ
	OVw9DmeP6tUB6L07+Hn3aWSzcCOus8UY6wqbEm7PYsv8jYaGq0uUwzGnQe8N7vl8cQei34TAzHp
	qJaqCuDO8O7hthBn1pBG2+XQoJf60kal4GOwU23R7LXUP4Of5I5dtE8mK6Tkf7ybBWHokWPRwQF
	WuwiJn1ul/+mOEQGzSPdW6nlYCyU59eQSlqK+fCEDuykfXxVpVaKLtmyt8ttZxha+a5S3SXAWE9
	CLV60M6CAXnn+o0Bi59IlS5QYuWFzcd/pY5entwxgc+qkQeuHX4Nc1wz5w+yeF4CJ0EP0Yjp5lg
	x4WSVGgjwxIL+dKapFEdypu9zlJysXq5ddh715RObU4XxO8Mp3dOui
X-Received: by 2002:a05:6a21:e081:b0:3a2:ebc1:4620 with SMTP id adf61e73a8af0-3a2ebc16c9emr8661555637.38.1776862101038;
        Wed, 22 Apr 2026 05:48:21 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f370sm13482572a12.7.2026.04.22.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:48:20 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Wed, 22 Apr 2026 18:18:08 +0530
Message-ID: <20260422124808.37695-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
References: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 22 Apr 2026 15:38:36 +0300, Sakari Ailus wrote:
> This won't apply to my atomisp branch.

I see the issue, it's because of the indentation problem that happened becuase of my IDE.
Should i send a patch v5 with the indentation fixed right now?

Regards,
Debjeet

