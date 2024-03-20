Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40DA85295
	for <linux-staging@lists.linux.dev>; Wed, 20 Mar 2024 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710969297; cv=none; b=uEfHHlblZueBgkEqLxdW0eGHtAWXbpEluI5MArwaV9GjLL8P/Tl5yIOxJ4Wpn6j4TZiqHku+8uqLKp+6/4UhnES7nQUzXVWqZgedCKTHeTQtZb1PWr68hBEod4nZRTpOFU2fF1UtcKUtAqBNpVeSTaObWLy5LAnONrPZzBCekfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710969297; c=relaxed/simple;
	bh=wd1nYr8m1KR2n3urOxGOjtHYYjJVJHI4iyGiHvDBp6c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CnK8U354x1JblA6/+cBuSFmhXTOqSzvhHCYlV784JQmHoaDbnKC4U7E7+VwzhK0u8Bwajro6OL8M69tRXlJcYS0v0G8FfgcvTzGPT5oqzDGXSoDLS3XctTh76w0HStLpSFSsZDr17MTnBZRietf9E+rTMop5G46O5x+4NuEPG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqGC78Hd; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqGC78Hd"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso227269a12.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Mar 2024 14:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710969295; x=1711574095; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7fFGAwFervR59ppe1kqtK+ZKXlEJIswmFJJz9qkT1I=;
        b=OqGC78HdjyJDAJubnOn1D+yxZAyO2m/e0/IUkwqAW4gihNzztdmtD+Ied6iFiJGrbL
         2P/drowQLs5C12bdyFfn1IsoxFk97wTseo3JnU4ZA8CkZpNsPUVhjiMWQ6rIPDhCIUp4
         SzAUFN9gforCBSOCwtw5GPKIzIDXnyS/nXfX8ciLwp1eypHPfdOjzNyM6YIKHAiGs8Wc
         K2bhmSCVG6ZdmfCS/ld1O1XzyoHi9W8gvPlnek6jvdapU47q2X2vlHpXn52DSTMfvz3G
         YuTvcii52vEEW6xkEr6vcQsZIH4mUjD4S9MqJLiimRJYlD1FeCk8qwOfkVTAB86X6vxh
         1D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710969295; x=1711574095;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7fFGAwFervR59ppe1kqtK+ZKXlEJIswmFJJz9qkT1I=;
        b=VZBd8XyO1ihjMex48YBYalCQINxDBTdHLUF151KRp/AIEghSEPhXcrJqfmrT0hI7Xy
         5u170x5aCWcdiC5bC2hB/GlqlDc+QfpKFEXjTr9YqsTAA4DVK0izvEbjsZQU4LdYyctB
         /phDre4X3GibnV/1FeQ/5vTy1NJGYaonIqPHhon3jjfq1mQTScquipTBB9dbOPeRDVpB
         +J7ESIs0wO4HHUJ1znxO4335OMXr/8IRRqxv/QBDYwxx0cmrQfM3ohum7GHOYlLCNlDo
         62wYvhRybXw89jGE8d/RJRC9QT63ZPPEauKNTS/GgBCWPa66zKCgn2RN0XSry6+E9b+a
         7v9A==
X-Forwarded-Encrypted: i=1; AJvYcCWY8fE5gceIrvWMFAXh6hUwVuuir0fd3ClhLOohf9gFVwcZ3mmnPpBqKHvd1oijwp4FwspUfbagQ3U20oUwTJCWVDEYa58MG/hmMzjIXQ==
X-Gm-Message-State: AOJu0YzAK12BnNzN6kPnOL115mUgAkJTfo6ReOKUjRCsz75rDWzjNdgu
	VGHgHTOMCIz3bQsGFCov32hlunRsrXR3jI3gjrbI/EcMWVK0dhrbtWymb+NSk7c=
X-Google-Smtp-Source: AGHT+IEN4zZwUIlDsr0tDIndaRJ8gb8+vxa1njntTQABc8skaQTzg+nHVWus0UDTG+TjZJ+f9r3nCQ==
X-Received: by 2002:a17:902:ea10:b0:1e0:1496:91ec with SMTP id s16-20020a170902ea1000b001e0149691ecmr8658280plg.20.1710969294813;
        Wed, 20 Mar 2024 14:14:54 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902c40500b001dd635551f1sm14145020plk.255.2024.03.20.14.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 14:14:54 -0700 (PDT)
Date: Thu, 21 Mar 2024 02:44:51 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/3] Trivial code cleanup patches
Message-ID: <cover.1710965653.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Address different kinds of checkpatch complains for the rtl8712 module
to ensure adherence to coding style guidelines.

Changes in v3: Fixed issues about backupPMKIDList and verified with
CONFIG_WERROR set and built the kernel.

Changes in v2: Checked any possible reuse of backup_PMKID_list
manually and rebuilt, rebooted the kernel and loaded the driver
with modprobe.

Ayush Tiwari (3):
  staging: rtl8712: rename backupPMKIDList to backup_PMKID_list
  staging: rtl8712: rename backupPMKIDIndex to backup_PMKID_index
  staging: rtl8712: rename backupTKIPCountermeasure to
    backup_TKIP_countermeasure

 drivers/staging/rtl8712/mlme_linux.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.1

