Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630ED285419
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772094732; cv=none; b=MdNObcuYnS7hFTVUZp4oW7WdUuC5K9Sjb1lBHDfPMgtVZqF3v+Y0mVRAXGfNxGGBhugSu4Lt4MFC3ot4ttlSpXFQIYCyU3TBijtg2+th5EVD5waUoe+e494/h9epY0vZjS3FdkwU8/K6Ml9/bCpAxck4uUPD3//Pl0A11zctjEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772094732; c=relaxed/simple;
	bh=SvBtbVzSnnIxPFqeiTXs5zLXQvNtZRORQCiFTVJDUcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JABxsQqJrOax3XfKGwqmSVA+tFONwyYMLkl8CsS+IA31EE/5f8KGMQcZjyOIyQj3hPPsrjIuGbb/H+8Ju3FNIMGL3X6gtK8V9ROHBFoVEKr0/5S4bAxU9oNkUpaPHBURq0XVvLf2ziTf3bxga/N/trjrFM8maDB/xHx2okdFDIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdhCSSwk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdhCSSwk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43988056dc3so553390f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 00:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772094730; x=1772699530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvBtbVzSnnIxPFqeiTXs5zLXQvNtZRORQCiFTVJDUcU=;
        b=HdhCSSwkuaYz8lkymzvEFlgpYUFCaCNJdE44acd5h76po5DaBobtILP6TImV59rhER
         lnhhV9qIwpC52+ShDw9N2LoV0LE0En9EEjtUoYdarP1V4e+tD6MxP6pnPy6XUwA04ahR
         M33kdoysX3rF2Cu94S4t2JFyD8mXn4RNlzhoYwuU4qQa0TbBNtRQUmQAqZ+vQpayG5/K
         GgM3ElWHqIJ3+O/6zs3DKhz3+doQFP+l0BxS0l0st6vhPXrz6US9VJFYnRTiq4MnSaqk
         gYN113DYeu8vzuZ0dKNteNvDl+lya0qE3mA2vBqgi3GngGM06cNqujDesqwZcTnku9W+
         /DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772094730; x=1772699530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SvBtbVzSnnIxPFqeiTXs5zLXQvNtZRORQCiFTVJDUcU=;
        b=PsVy2QHZE+fjEYmbQfDQGlD4lLfgJkYeeo9fO0pv0Yp2vRuTZSRHrN0sKR6+qxcK8v
         +sE+LwlpI0Rf3EV24EMFIcOQPl/8cyPpC29RXYtXh1UHRnuViwLe55Cx0yK+QsNSC6g1
         9T19aunr3pyP6O1FzLn/7/dR+gvqVi0gY35dEcQTczivlxjMHxUkbJEV+h6HbdXX7JH2
         SzeohZq0WeJ61ETqj38Ogrv7jsByX3xmUFCpOir/n9PLeHRmzUZ2ne1/jPsm8eoOyYLM
         jZVYTy78ALbPraVBs//IpfoD4W7uYeRX5Q0o9jgURqKj7CGB0H7gaDT/w8ftTVRn7/DQ
         fubw==
X-Forwarded-Encrypted: i=1; AJvYcCULwDDcRQeN8oSefvDHAq9c4H9qwn+nGgHpk9Z576ZttcY3AizvPiQSbEq/eazc7p0PpIyBX3tfQGKBq1hJ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo14JhjnbxmW+TARVGEGZy4YeVrbgqv9iZwnBue/Nl9irBet8J
	zmPLjhaRTPmnoXW0HnSW2geR6Xy013lKqFRp0Kw6sXHwWoXJhLNsSxM1
X-Gm-Gg: ATEYQzyugmSJLmX2AZfS+ClTJdADuTQt8Mxi/E2YiPbfcR/hL0XXyCalP08ZgpqZQjK
	zWtIq6y9sKR6u/T7O1fFWITam6OD9inZv3DmE+AhWt7/meFqOF+FK5hp8TBxsv4diLoNWeoQpZM
	5E3Af7+rOGyGcjkUIRx1LOLsYo5eYE+nbJtM6cLUomHSOzZ44J23KzWqL/ehwU2TWI07Q1Kdcpr
	b8mNFANw2s/CdUBVSYTtiPGFmMZyPyldvs/JiP00DADI4xNIQyKUsSKATualRhqYE0LMBB6n2ez
	1myLaj1ZQWgvowOr8zIBlS9+6Co5PeKKu9VYu4PKO+XTGvLxt+VKDl48YdPhuPDC2RrdEDvSeMN
	AB7SM18/LCPPk2hF/44lRcbeI6LtGuYmWMr36IRLTPy991oEyZi42g+dtMsTlan5fHx4iL95Jj9
	wV0YdIC1ve/IqZQjFWg8PFW2gJPWiVbRm1NVbTWlI=
X-Received: by 2002:a05:6000:2dc6:b0:439:8f6f:1b2a with SMTP id ffacd0b85a97d-43997ed6d0dmr2654481f8f.4.1772094729583;
        Thu, 26 Feb 2026 00:32:09 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439934cc51csm7951057f8f.3.2026.02.26.00.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:32:09 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andriy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: fbtft: fb_ra8875: replace udelays with fsleep
Date: Thu, 26 Feb 2026 09:31:49 +0100
Message-ID: <20260226083151.186260-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZ_6QvJPZplh6xtd@smile.fi.intel.com>
References: <aZ_6QvJPZplh6xtd@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

write_reg8_bus8() calls par->fbtftops.write(), which in this driver
resolves to write_spi(), which calls spi_sync(). Since spi_sync()
requires sleepable context, write_reg8_bus8() is transitively guaranteed
to run in non-atomic context, making fsleep() safe to use.

Best regards, Jose
