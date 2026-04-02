Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613352877E8
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134859; cv=none; b=CveM5CwsjLowN2wG6kEjsH38WnBgbwG9mDqgXYMJYwQiT8cqBwpTcbx/RvXXXHyQwp+79bsIc9KW/ImXOKt0KfzhDgfhzDiDIYCX536gpuSZlqBC8KkvPo+QMbiyBGMIXRUIJ3Zs9GTXIbxSzey5SIW7e1qU4AONFScvztCqeZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134859; c=relaxed/simple;
	bh=P4aQMbaBnnxQLePUnINQzLxACT0pK5SmCXI4vlruYo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZviADZOeo5SAzQGKKufe1Tarf6jxnWCpCmX/FLLX404A7WcZZtiBX+jWtgCp1cbbGGvKnE0zVTBlkwv9qCZR44v/PnW2PPoBgts6RbEkH+uOuszJAypDXBygnf1bS4mMEyeF3/zxumV1WSifaj2hXl9HirM2eml0kB+uiDV+YaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyffRfbd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyffRfbd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so5596935e9.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134847; x=1775739647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=UyffRfbdjflkA2XUFg2XkCLD9b0ikEr8Pv8hW1+0hURjNwq3t124qhR/N8VcuVNrTT
         TLscR5a5uskjyuavCnnnT04hHSDSbCTRcA5ZYQb4FKpqYxuKwYT0O2BRTm0Idc0mubLg
         y8U/aJBPdjzbOGl4uc8eRgq3C0kR/ojoIi3Fr4V6bnTgY9rTGLuNqwKxgL36vxVFBLfB
         0ZtnFlf6iAR062jJffwK9RlaLy9HO1Ni7EQyD+n6Qx/FfhHj3lckhIjN6AoK6MphAkxp
         49QW/VQwE6GVEMIlk732q7I2ACeG6CeOi8JpGOapnddu0EP2HHSSYkB1jO6fgLjzsoAj
         ZpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134847; x=1775739647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=j7TZxZEVU8uYIAmlugLg3E81Fx5o9H/TzJtRBfPNYJs63MS51FQF78hMHEkWOHJ6J/
         ajidaGhK+ksSu6u4eV1QedFakra4a6LJ7evPKUlSOA0MctTvTIUD2Ljt64scoGXmzHpq
         xufo+4N7EszrISrP6bUwbPLRolvhfCJFeX0dfzdU7TuRD65uGZw+X1mWLlXKXHhx6hG3
         kBd9mE/HTlCLQCApMKNk/qHLHE1nann8bBTP5ur6K3akkDLup40649NoFpix72k4lIXg
         vWpsPYfzYjLpFsXWc3OUT8w9+W9PyzM6H17pv4rSbuJyVyU2jjJ4SBQdse3iVzg+DQt5
         2mOg==
X-Forwarded-Encrypted: i=1; AJvYcCWKg+2v4DBR7P42LL/U0bm9S0cRPDDocpZF2W6AxtwXRAqpGbTdrkpbIKdMXTF6e9Z9pGODquKdbTFTramG@lists.linux.dev
X-Gm-Message-State: AOJu0YyDodYbg2u6yJs7V8YlaTHMlJz0LtBGAIGad0yb8r4F/qppbGpp
	FzlmZ0FQeG7ttUJGBEp3tp5K5h+ZOtsaRRJL8Iw0F3G/pTSWjnvawKBC
X-Gm-Gg: ATEYQzwE5Rh2BznDwvbOBPlf33axWteTFbs2PzCFIx4IzCAjiWmsEd5eTdtYQxFSb/T
	qmgl6Ry/DObDKOhmP4grnuUaNu2BRraNvpZP9i0g5dVZRCzMbyYWJneERMFMOEMXPphM6wHz9Ox
	f7vxZYiZLilN+fy4502R5B9JssS81GL4ML7p97BWOq0fMy14GFqzKglehsfppiH+eWGsdBBcx7N
	vTgnRknaZ0elh8iVQZudgW5hIjJyfTGCn8AaH2cWbqOK9R4MW9bGBHU5FKushiUMTfaQdqBE0oZ
	O2hBYbXNOSKefHRT1pEz2Y2qXX1s0af/21kF/E3ReSyKol2hERUIhcx93Y4CcBNyJw7LEPkklIH
	q3/Oxr3S0xykpne5UlD6+aVUrRS23xgwYAzZEEwVpkBu480aXLrpdyN/aQZmFx5B2jjXDORzTA3
	T2zq7c3g0EOb0sSnUoTOk=
X-Received: by 2002:a05:600c:8b83:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-48890ac91bbmr39369785e9.5.1775134847181;
        Thu, 02 Apr 2026 06:00:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a626100sm121462725e9.1.2026.04.02.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:00:44 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:00:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <ac5oecJ05oZD25VF@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>

On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 

git am isn't set up to deal with two From: headers.

> cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> like disabling runtime power management, releasing claimed sram.

The first part of this sentence is missing.

Otherwise, the patch itself looks okay.

regards,
dan carpenter

