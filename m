Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4174BFD;
	Thu, 14 Mar 2024 18:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710442087; cv=none; b=AALOV3Q4chuLjD+CN2JjMBTNopy0XHbaGWO6HMnzTto3gaHjYcD2TmClRADgXwC2cdCFm9DhqPn1K6ZJ3pdjAyYNTSb4m8SIjeKdQXkjNMHKNvK6L6vlke85JCfxTqaEUWtpIaUIAjSBDHI1hRKsKr9k75cqgqLAxQvWmAfFN7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710442087; c=relaxed/simple;
	bh=EZhbH9Xwujr/B3oht4heJ2cRMgZi/vMO7ZMCqXz3KMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSf+4ud5iIzYcpYy4+FE/WHTOdlA1dGJHaBjTljFx0DJEvAoM8ZD1n4DkIZmE4FlbFJE559gXivFiC1Lm+kWfZY+6UbjpUYXf7C0lwtyAUSDTOLgIse5ut0mBzTz5sHwqt++sw+7sbk45IrRKUnChNM4BAanajJwyyrE8jbu8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGicBCQf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGicBCQf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dda51bb52eso9595585ad.3;
        Thu, 14 Mar 2024 11:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710442085; x=1711046885; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCEUuHzDWcMi+OoMke8TXPhtm1lQOemQGrFVoSbQ18I=;
        b=HGicBCQf2CD2G3Mi1SzPjO8QCynFZKqt4ND/JuaQZ/4vgDxXuPqs1CCsOyZVfGxiD2
         i3P98D01/XUbcfulyZd1N32FFvCvJ3iVLQ2id5V9qJNbAbWkT9un4O7mlnlugqYpmm3I
         e27wD2s+k3PKshAGv3yL2h/WoWU8Ocf6F/ds+NSEje2ILWr8oe9z8BOGZVj1TvErksUw
         Jk1lRHFKMhUuIZXW7OEWQzHUMld/UlGUNcpSx+neVq5XL+KZ9YDgd8nmghw5Q074aKTW
         uxywJkJQQY3QYfO05KXySuJtYUtHmAgs2UAAOD7KqELxm6X3aO+2TF5JZRd+GAxbPBVv
         s8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710442085; x=1711046885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCEUuHzDWcMi+OoMke8TXPhtm1lQOemQGrFVoSbQ18I=;
        b=Y45ITVNGQhHgk3oSjjsl67vliE1KR+YT2TqyZSZuUUQJGKUhxsq6SZblE7dKwg7ndj
         wF5qsVh9FdFuS5N5MLxT6eklGyPhYwZTTj3w0FRrd9ttLba9StnxHe05PtQsDS7k8fq/
         L6kkEsTjHJ+BTzLu7t38joMyKtxLrzUsIwpDEiQCAvP+MGC0tED27ttCirRy5qpx47w4
         eeHYBJBogVOwImxIrIHJ22esXfT/XLHL+U6kqSLf+DYdZ1D8WeGnV1Vth93VE/AX/c1g
         Z+NPxCk0AYqyyuyAtzrI6kCyidEadXbB7Lb4tc5rZ7EJ+/KgB3sUdlEUE2eg2PnZyb8p
         xjWA==
X-Forwarded-Encrypted: i=1; AJvYcCXBzc4nY50igqKspDRXQ1EBzO/tmokqfUyPTyPhRdRg9SOImo/5d8ATBntrfVnuJOPn7isr3dGHVCSort8CoQTNxmu+exu3siW/AhdVHw==
X-Gm-Message-State: AOJu0YxBoPo6Yxq648DqXoRZn6wjdTEUce0JY6Dbr61THEyqAIDHBfk2
	vhYZdAbiIUF3msUSetKyKnyLWu8/Akp+MSdgXaO1DzGFAh1N0f8EB7VBlkJa8+s=
X-Google-Smtp-Source: AGHT+IEDtQA/4/IxqD2QHGTaBEu5I8uPvanoYr5fvT4nwEYTBsMMRCgC3ZzP5HFhm2YFPaLC4rGc1Q==
X-Received: by 2002:a17:902:6504:b0:1dd:de1a:bd02 with SMTP id b4-20020a170902650400b001ddde1abd02mr2656915plk.41.1710442084587;
        Thu, 14 Mar 2024 11:48:04 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.66])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090311cc00b001db9e12cd62sm2069170plh.10.2024.03.14.11.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 11:48:04 -0700 (PDT)
Date: Fri, 15 Mar 2024 00:18:01 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4] staging: greybus: Constify gb_audio_module_type
Message-ID: <ZfNGYSC8CDHqVPlm@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Constify static struct kobj_type gb_audio_module_type to prevent
modification of data shared across many instances, ensuring that the
structure's usage is consistent and predictable throughout the driver
and allows the compiler to place it in read-only memory.
The gb_audio_module_type structure is used when initializing and
adding kobj instances to the kernel's object hierarchy.
After adding const, any attempt to alter gb_audio_module_type
in the code is raising a compile-time error. This enforcement
ensures that the sysfs interface and operations for audio
modules remain stable.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

---
Changes in v4: added more details verifying the change.

Changes in v3: added the message that verifies the change,
as suggested by Julia

Changes in v2: incorporated changes in commit message
as suggested by Alison
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 5f9dcbdbc191..4a4dfb42f50f 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -144,7 +144,7 @@ static struct attribute *gb_audio_module_default_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gb_audio_module_default);
 
-static struct kobj_type gb_audio_module_type = {
+static const struct kobj_type gb_audio_module_type = {
 	.sysfs_ops = &gb_audio_module_sysfs_ops,
 	.release = gb_audio_module_release,
 	.default_groups = gb_audio_module_default_groups,
-- 
2.40.1

