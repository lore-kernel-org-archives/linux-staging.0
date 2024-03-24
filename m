Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8814016;
	Sun, 24 Mar 2024 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711313288; cv=none; b=rePLsntsXAgH0h98WaCzWOy8XNaALiU0raMSLILbWF9HFdEvaeUf6Id6xuz/6q2ZIKTCyV2/qTw6AgyEfV5oALDq/Bs2+PZ4C/o5EeL/3RGFICOftwHDb+Y0kUt8SmJ490Cu0R8bNvq3k2jm3hPZLPFtE528hzn2+JBh6we/Ank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711313288; c=relaxed/simple;
	bh=o0ThGP2jpKKCnWSeV748HKSHrZ/Hu6nvzbdySrCVn/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zk3BqbgXwhbBXPTeDRQBlKroiuCxX30Fv7mQWVPCJ/wz/bfj2clRNkoh0oTfNh2NHqpZ4x/UBzJQJr6Z4F3LhDiSetY1SNiU2Ws7KQ8pLpfdBopMFpVnqjR0REy0npYAzLrivGmz6BZl7sV8QGJA+07PHiHLl8h3hq6WpF+AJ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A62lQJye; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A62lQJye"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ea8ee55812so1580546b3a.0;
        Sun, 24 Mar 2024 13:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711313286; x=1711918086; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOr4nW9GygCT5+f5JrX7f9aw7Oxhps1fXXCviiZ2/1I=;
        b=A62lQJyeiC76vtYO8I5zQuD5l54s3b24xSis1rBvKHc1LBcHY+U+T4YT4fu7IOL+Qm
         YAM2fyIOdNJndMDw6I4pTLUO+qNYyzbcFwhGBjPbfquioiGCDaq4+xPAfDkvz2quGHuG
         oM0BhHXeDREyZznaaUR7UVnwELFj33hLbdYMjJGENazO/aUHxWfixZxVM4+/xxPT7vx3
         u1psaLUGtyIwOy1UmOaV+/l13r5dvc+hf+o/p7wMraa7yObYOiNQRtUFqBsbTmo8SQ8i
         qqDStqkjNe4F9fGJiTsX8stHTaX8albQSUoIcpIk1EOJLItLF/zAnfp3cNYr7LJvIq5F
         Cfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711313286; x=1711918086;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOr4nW9GygCT5+f5JrX7f9aw7Oxhps1fXXCviiZ2/1I=;
        b=BVnrAQ+swbRG5L5gR8wPzPOiJj7I1tO7sLRFTsxBOW5b+gW+WjiueNmxq5ElHTWwHT
         I4i8IxDjkfelvcIdm3FsnbpdYM8hrJn4zNbS9JNxxVNsSNBlmo8drgDKnivhXWts2QOh
         kUqSAssKXn6yBRd3cYhU+Uv6rgV63eTBoT+BoANdjTSlHZgi2iELuunhS/fHHJ5xdLWM
         9C84D8y1q/XlLzXxlBwUxnVyGJ9t4x8VwFCJiGp1LEB/KTKLqLr8zzWkF2TbSBeT+H3x
         ts7fzxit0AZ+73CmXIxB4vUu49NE3Jzrooh3GHMMnIIg0guh1vIpUy7R8alUdFtlV4fM
         C3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6j53fkE0S2VKLJgZa6jQ7FWxFjn3hCh3WW4IyGKD5CAExp+8KRdO0s1UkApcvBS4wVOCNWKtyKE1ALbE0+haqwC5g/qRHjAvbqLjNKg==
X-Gm-Message-State: AOJu0YwqaP1H+uNJP2zk8c2WzSTO1EFHQdmuugkPvBqqXtTzasJfc7zw
	FwBS0lSOgU50vqIj/EV1x8ODQSMlg6wZN4LtRLXad0Bl/rbBl8IV
X-Google-Smtp-Source: AGHT+IH8zVKwvFo2k5FG+Ns3x6y2zB3+ejGnDFLscJrM991V+62Zie9TTaYq6h0PgwlxBeCuO9Lyeg==
X-Received: by 2002:a05:6a21:3986:b0:1a3:a637:9753 with SMTP id ad6-20020a056a21398600b001a3a6379753mr7952698pzc.12.1711313286020;
        Sun, 24 Mar 2024 13:48:06 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id o18-20020a639a12000000b005cfc1015befsm4726936pge.89.2024.03.24.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 13:48:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 02:17:58 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 0/3] Trivial code cleanup patches
Message-ID: <cover.1710965653.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20240324204758.G4BECJ9ipWhSH2NMITFvZheqQHWAIsHHlbW4eHIDVRE@z>


Address different kinds of checkpatch complains for the rtl8712 module
to ensure adherence to coding style guidelines.


v4: Update the changelog to match revision history
v3: Update memcpy() param to match new name backup_PMKID_list
v2: No changes. Just a patch sending error.

Ayush Tiwari (3):
  staging: rtl8712: rename backupPMKIDList to backup_PMKID_list
  staging: rtl8712: rename backupPMKIDIndex to backup_PMKID_index
  staging: rtl8712: rename backupTKIPCountermeasure to
    backup_TKIP_countermeasure

 drivers/staging/rtl8712/mlme_linux.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.1

