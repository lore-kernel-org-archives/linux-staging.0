Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4DB1F236B
	for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155695; cv=none; b=M7f18hCaTGGNpjImGdaIFB35z/5qJJkT3hq5xqnNOV6qWXutsqF8JGm74HWCOFGzTuMuwK0CQxYpeOkTsu97VgZiET7e6sK5fKXxw4JB729nG28B5DQG5hc5Wy6nExeLXh8DI9P+4JfgPK1qBP2Rt23LXxm9S/vimUO+6nVz4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155695; c=relaxed/simple;
	bh=2nMzOHiGYJvxCYd3jkO6i+jsdS0V2XLFGx4uJLonVOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAOE9BrvIISWSwCpAiWR2/a5tWuCdfS7RxLuJFo1Olfp6shNHTxqHR0WDcsfouU0vsbAXMb5I9wUpGKtRssgQVCbAeKCDMHbM3AU0ChBQfeTjfrhBnAw1DcgPXAPrAdS8SRuE5j5JZ0qacT8pBy4VZNF8UnGFLggH0nlldao028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2A/sRBB; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2A/sRBB"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-220c8f38febso50537595ad.2
        for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 08:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740155694; x=1740760494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IWac3BTppITgPA6stiUSJpAZ3uIjnk1xho+BbeLNeo=;
        b=I2A/sRBBTljS1E9e0qgo19eecT1eUit3tVLXUmiFWHBfsE3sEnL9v5fcGeLf5+dv1T
         g7az9KEpcN7/9O9JqXXcNtVsBvEiNITQ6bTaf11kon9Hldaf9bhGewL81GAhmz/eeJVT
         SKzxyMqNHiBnWDKjB4rXTeypuqiqvyVD7ZOv561Msyr3u/xcRcd8A/1/yA3Hya4T5L9L
         F6e4qp8pUFivilum6WKLMXdk45xSe+hB/rPQE+WHQJsi7Jfm1s+9pv3lhVYWJ0hsNpnQ
         NLH2hdlYF09b77PbYCqamXeUwpYrh1iRKvcksLzw0AR1FO3xQjKq3+oz43CLOdAvMrx0
         w+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155694; x=1740760494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IWac3BTppITgPA6stiUSJpAZ3uIjnk1xho+BbeLNeo=;
        b=FrZ9BE2cZ+Sr2UTe4SJXJzdUroFNsVNlT5OFOIOT+D9PIyLvmntv76cshQ4EasapTo
         AGJs4grP5WiKwRlKFqZs/RM/d1xIzcRecfJ5m/YjlreHi7sYiOvfTE2zIq4jAM7vhnYf
         tEXsov4moTFkDuVKR2ah8+/DShIUjVjdAyz7G6GEqzaSu5Cj0BLW78LRqSMHBD/GnPfo
         3RFX5r75YB0bw6lK4g8RqBDISc5sHHXj08tedNueK8KnjRGePb27VKM5ztKEF2bbljjt
         0iItNgW0vZxAXyjA42wehnNu4WjvK1PyGR7vGDbaMTGpY/2YGX6snof0UjNf7HDii7xP
         vusw==
X-Gm-Message-State: AOJu0YxHRv48mTf9QTs8nM9oG8rlJc27A7cUn5XyIdMMb9tRI/HdQWbL
	DhsQ4l2c3cPNn79Nit1IUb37bu9U67vkze7Z8VrT+3ZbdBh+lxZS
X-Gm-Gg: ASbGncuY5Evrkx0Ua8U0Tmn1Dr9ijtA6kY5651Afo+vU4h3XhpyauRI1OXyfeahcuSX
	/oDNo8MySBD++fDdXVWWLzUn7RE4XlyVojWrRDqQ5dXvnOdUG9d/2XfAqSj3vpXEyTY1Fe6lCbA
	O37oBQHQpW5vxiQx8pda9a+obB8q1+ZjkE3dM3r+w+j/C23gr3SZbNq68oBD2CkvW8QrpTE7MtS
	5JNkogzypgqoALxkagnTiNpkUzAH1KWLzZQN2lZAORZ0cTiySfQzVmiNPzgKc62oTPhNjSgfsp4
	Tyvc76W+qvBOGLny2feHpErwKINPJALHmtEr
X-Google-Smtp-Source: AGHT+IGzfe1lVC9rnbfye8PAwJBsN4j0xVxqxOUe/shv2D9rTTcs75+Qv990i8d3bFc0eM1snFDcQQ==
X-Received: by 2002:a17:902:f546:b0:215:8847:435c with SMTP id d9443c01a7336-2219ff9d73cmr63668255ad.12.1740155693511;
        Fri, 21 Feb 2025 08:34:53 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d556d6d2sm137213215ad.177.2025.02.21.08.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:34:53 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] Cleanup of most_video_dev structure
Date: Fri, 21 Feb 2025 22:04:24 +0530
Message-ID: <20250221163444.57492-1-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

This patch series removes unused synchronization primitives from
struct most_video_dev.

Ravi Kumar Kairi (2):
  staging: most: Remove unused mutex from most_video_dev
  staging: most: Remove unused spinlock from most_video_dev

 drivers/staging/most/video/video.c | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.48.1

