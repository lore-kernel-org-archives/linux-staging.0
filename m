Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A097D44AB73
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 05:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698374; cv=none; b=gp+1fb7zHrt4vWK9FPUW0qROlJLTeW/l1k8dvsH7Iwtuya4Qrogd0hVfNk4rug60WE1YwsD0t8c1UbPZtgqsXvhIvNbsCKcAz46Qz3m2yTW0ZctgUqPsGxpw4XEKjYxf7fqHJLu4gVSfV3gYAgio360riN2/YHoNybRpkRn8JIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698374; c=relaxed/simple;
	bh=1EQrmiMIr+/Rgm6z0hr9W7JgcM/jSO10q1bn4Wg08Mc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzhpHEO5RRinooia+B4niKs/s3qBCiUwBL66NHbX4474ciLBBWVImjc0cxL6qHrcGCWriWILshCFNTbLhSFqmVdHRLE/fE+qmF+q7ieNv9X7gQO1l1RKxgqZliCDiBrFM9SWalNv6A1ZRYzDc/0inqIoGuatb+PYtQoBQJVh7jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6XQv5HB; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6XQv5HB"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ee125ec926so956161a34.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 22:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784698372; x=1785303172; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1EQrmiMIr+/Rgm6z0hr9W7JgcM/jSO10q1bn4Wg08Mc=;
        b=R6XQv5HB10x7ytZyNbBKJO7+ixtYLXEfh6E1lsjCIAWeXCd/WUxP/iBxei5g+7lfgY
         S4Q49HcyHYV29YtnqDRnOsMukz+wayoJKRoHa14nswei0/BZlNR0QJ4ofYCBr3aJMVGG
         hWqkVVt+6EymTluXSbZ3xoxNMensb7AOeYj2Iffp3rmlwU4SvlI0x9vUVAGS1zoUSxsj
         qExJqOSIDOv7Fc2ZuvLw+CI+uAf+P4zg3PTI8WTDI2xkFUcbm+DQh/a9/faDw2X5TAz0
         Rd0hLRE7fs0jptRPvexjuQM2cF2RYKHpTnR512TcTjPFDdR6I0aHWGce0HILVQ0R+Ydr
         ogVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784698372; x=1785303172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EQrmiMIr+/Rgm6z0hr9W7JgcM/jSO10q1bn4Wg08Mc=;
        b=Be6nQlpYBzDHW95zjCJXLGoGZ5YNSYnBODwjLESVjG3hNPsgSJOBQBCdbMYJs3AGcH
         kOetZSZcMN8n1qWcJtsSVIdlHECIUFU035NU13P7r25C4bmcwOOrrthLBZoAUV8TKSJC
         VzhbFc7pTUZWKwfetEt7FewnadvDm49a0Ky/MFqkEN19zGnmZhj0ON7Xn5SQp337T7kF
         cB8NbtFx/p7iW0BzKWl4SUIXe0cc8vN8IORYw2sotd6+U289h6WlNEKbGRX3onQTROAs
         CgaTPW3o83x5clOJPg9BP/FZ/2OiIbeMUWv7KwKVHCtux9JHNO+IALosrjJIQ9KoP9g3
         RnFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/tWu0T2y/NcXxRXDJPBF8RJIe874pO7/WMcwUG58VQWpW5rp1KnTRBt50Y0gn7TD3k4T2TiF1kCK91UE0@lists.linux.dev
X-Gm-Message-State: AOJu0YxjQUccCsXscJvigfE2GoBDTjNPsqmW3Bf+O0aDbigId8HJRdrO
	CKBhQf2QdPnfMNSpKZTB2CTAvsN9KTlRT/FIEodzsmjQh9MGsqZJIzCT
X-Gm-Gg: AR+sD10EtEoK0DE9NAADFxPxrc+HD1nHJtVYT9xCDN1Ypz03ecG8PqKZfYpG/nI1rC9
	RG9ieb8M7XUUJKl4/Rz0fxT4XXBjv4w8bFdOlMOYwCEmv/YyvGXIaBbQAd7aQVl+tHVRH6R1+5y
	3AqAYTDAWAobdeJPZYEXanB4wswOmH9PVvDf0oNDKsX36r/pVwQ0pqgvLdyhhnDDybAt4Ox0F2L
	EyUKmKpSr4hYE6o6u2J5qDI8YLTtNsz5zZUucdLu2qY5zjFuKhlDEG8i3b9e6XKGskhWoITyOF9
	9j/kg1heyjEyRq1jhIf/fbYX73od4J7Gk+5mz1zAe3bDKhAd+XWXCcoDwfcjKzJA7cpLi5fPs0y
	mf615LVgUWDx5cxWKgUvThyzyxqCgwsWMtfOrtMmZ/mBzoR9xPotfRjEeUhY894pDJFKT5Sr2YA
	UQKNUidhBLfh7j5A1trJi7+19J75HbrLW+EYAyjiDGbitx
X-Received: by 2002:a05:6830:3592:b0:7dc:d967:63de with SMTP id 46e09a7af769-7eda08ab11emr12549111a34.3.1784698372539;
        Tue, 21 Jul 2026 22:32:52 -0700 (PDT)
Received: from archslayer ([69.145.8.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a1087b3sm640456a34.25.2026.07.21.22.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:32:52 -0700 (PDT)
From: williamxelder@gmail.com
X-Google-Original-From: archslayer@archslayer
Date: Tue, 21 Jul 2026 23:32:50 -0600
To: Dan Carpenter <error27@gmail.com>
Cc: William Elder <williamxelder@gmail.com>, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: remove comparisons to boolean
 literals
Message-ID: <amBQG-RiRsRCFAGs@archslayer>
References: <2026070738-usual-rinse-7c52@gregkh>
 <20260714210843.72848-1-williamxelder@gmail.com>
 <alc6hzi8Eb8LLRqx@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alc6hzi8Eb8LLRqx@stanley.mountain>

> Please work against the latest staging-devel tree.

I am no longer continuing development on the patch, as the patch
is against an out-of-date tree.

Best,
William Elder
