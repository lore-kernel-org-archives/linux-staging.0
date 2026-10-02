Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B1263F5D
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932707; cv=none; b=N0gMrVa5b1wZ/mHelPM2PTIBWBTuVCkDjBnYPWglCz/mFxb1Odc6PyyrrIetFsX85zc/KKn/rtBZO/SW3FAM43gxg37DRZsyLNGfHnmq6aX9xiyxr0sbMNxul/Y0nYfSWQmFOeuVkEaCv/tn/ENGvngkYCJaIJMIrFPMwKH23qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932707; c=relaxed/simple;
	bh=puMJQvXevs3HfhMHL2nYeCos2nWEYd1yPhYmpj4JZHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1ahhVgH7a/R3lYbvD62MZ9zcxNokGGokowBym0HN7kMwrRu8VwX8agXRbzcRvBRMFrBNAn0niHEyISgMzXeQyq5mNxCDUn1zEkFBiVvz25hB6B534qTy+WlTrPv7i03proe5Php1OHpPpFTHUWmmmpAoePfs4Z+a5gQV2jirzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuIfux7r; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuIfux7r"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso41603225e9.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932704; x=1791537504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRXlY/+4LCQNl/VbKdPpV5Ly6hs12yT1nCaZQ3FsDE8=;
        b=BuIfux7rf1licP1O9o0ZJrlkXgFmDG0kyntOEjKKposwWZSlFHO5rTXZKwAnWCCX6b
         AG0VknW88fpqcyiiExP0CECC6rcnUdbEzwoseXDMaYeVcAkDjhj/gGTfbOC7CVjhqYI6
         q8VVZltL1srsY3Dl65U10QDt/0dHPrJxCy+vtriuvT6i+HUMDGb0rOOkYc/M5t5WAOMJ
         762Kxj7529jebQ1mEeBgc3dHk0NGDdqRKemLhDYOjsVumN/WjCHHbqA6hJtTpnAhTihZ
         5ySI8opm7VwdvwWYO8JvDNvz5Zms3GepMCZR6KSurqs1H8wjRlRNEJRZPiJh+VwxHbjt
         z7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932704; x=1791537504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRXlY/+4LCQNl/VbKdPpV5Ly6hs12yT1nCaZQ3FsDE8=;
        b=Dj0hBmFVMpRGBsj6z3shbA7LVSgj0OkVgN1AYXa/oCgUikkIZdso0f3gD04OVpKpHr
         sw57ZSsZUhDxh74S06d4QH3njeTl6AckhiGh0Rap6NBGs0lKWkz3LW3BFL5/9PziXaQ5
         XTlLGs58F6Jz6yUkEFaidEhpi8zXBMMbUJr6+7qkOU+qYCixuWVmbiC6xmDS+QytmoL7
         N5lV21Qcd2W5mUVQ70raFQHwQ+NvVf6rC8iiustGH2UBVeBcXOBmiaeTbebFFYkjb21s
         vX4urPyyMqhZi2RJBd4KwX7Ayd+8YvJPGgrVFgZc1nrWVl58wZ1MDP7TaCdqIcTKtl9y
         0zOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAGqOHd7NgDXN/lz8boWwzhV7B12/7lc9Dldh2EEHG5+JCPQ9MZ90qqHQbiIAec+Z62fErx74tbHzTaDwW@lists.linux.dev
X-Gm-Message-State: AFuF++k8XCMqKqNbi6RQ7KZBUET4wywnEh54xpaazBNEyKh7uBEw1AYa
	Hvi+9lgpKXYSg6udxdlGbyZSDG5gzQi0CK1d1tcDSg52bdYw57/9gc5k
X-Gm-Gg: AYBFou0XsbiZH5zbn0jpIJ4OtM4b0a6RpKqUh/zJa+VRVXeLRE7F9nNmb16cSBCBFu5
	cMnCHytfVvdrb0Ykg4sudlLALZfefdcDbI0ndmbTpdfDf7tguUdDVO3z8oYO7uy4pabjZ3/8Utm
	LMWwsUF52YtRIsJgAjbRBUirDtBtcqmIzhVtPtFrL+GraHEUuaZ0AlK8Hvbz3qppTq0zKDeHXts
	oRkoPZEIIapbiNe6EeFverOQc8MsEMLkeBB60Wq0iAiAoQ2fKqfe6mLa7bnM7LsBbQdjuFk0EeS
	ImHm2F7enNDu6xY8L2+PNv2Ub39oDIToY8UmHgDcsl3MJNf+L3d67dq9podBmxt4zerIsLG3HA+
	o/gVH+j6H71kFGvEjLkQzkTBAroMYyOQGCn9TJD3Ggi93ArwVB2BMyCDfLMCw2rWvO1NgIuxWj8
	4rSQcgdACEmzFaoyhaAfJz7vFx9JN8T4k/74HNQP6OC9ouRZY/Huf6BUmmBX5TYoGe7lMVL5dkb
	VvoaQ63rXyAl0PiQUV6j8NCs3O7ehGpX8qChSsT+uHK5XD16KxbAeBp+1Q=
X-Received: by 2002:a05:600c:6a04:b0:4a0:4f6:3dc5 with SMTP id 5b1f17b1804b1-4a027542255mr25781515e9.7.1790932703704;
        Fri, 02 Oct 2026 02:18:23 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280ceaf0sm69201745e9.12.2026.10.02.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/16] media: ov2740: release group hold after gain write errors
Date: Fri,  2 Oct 2026 11:18:20 +0200
Message-ID: <20261002-media-v7-p12-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar69K8mZVNmDqINI@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com> <ar69K8mZVNmDqINI@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added in v10 patch 11 after verifying the introducing commit:

  Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
  Cc: stable@vger.kernel.org

The stable address is a commit trailer; it was not added as a direct SMTP
recipient for the feature series.

With Best Regards,
Maurizio Casciano
