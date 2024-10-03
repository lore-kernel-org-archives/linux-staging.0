Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7042065
	for <linux-staging@lists.linux.dev>; Thu,  3 Oct 2024 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727975255; cv=none; b=Dped2bAkJ527Xp+dOuN1xi0mB5Iz42j4r2W8Pzek7cf83Vmut9/UxaoTB22Oh7QjAwUNOMZbjmtVV3/pYguf0hEjpg/IT5W4l0BSGwEp6zygHm7EDHgneTHwURQ2M+EiEB2HK1O1uxmkkk2z16dM0WYTpTmuKoBDbp8GvjXBx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727975255; c=relaxed/simple;
	bh=dkfu7OpedYFMW4blTd8tKYx1+2gfV7GpFrrUeC40tik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bed1QWaQD9v3AXPpwjmzrQPkCQVcf2vRLbw0byT+UgX4PGT8e9KShCQKGLfCrZ2RHI+5Q5t6koZPOzFjsXUS4I7/OJHtrXpXqSXvVgbRCQntfQ6BCA3pd2EUuJsr3BCQ9xO2GkU/579zHL6tXFmvfnb5ZZ3kbCoVtKBp1zxAUSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caSLILA1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caSLILA1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b78ee6298so7549515ad.2
        for <linux-staging@lists.linux.dev>; Thu, 03 Oct 2024 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727975254; x=1728580054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkfu7OpedYFMW4blTd8tKYx1+2gfV7GpFrrUeC40tik=;
        b=caSLILA1qGlqfAKIF6GU9L/pMb9C7u7ayftazOHB8a+/y6AGP95j2vIHaLZU8wun7W
         s6rDsP7JaGrOttgSMeTT11VvjbSOYjw6R9vJyjWzaRnJMAW0N9rrR3HNVn4FodLatRZv
         kOzrfsflVr0KyBavnV/lLc1jj7nQ6AE43vASmS8dviaLx7U5OlUeX/tXoYCEXCZwf+pW
         ovYEII6LPN5JWG68dgEG4ATT1YaMBeIRYIm3GSVzQwPgVXbcCew0xkuWd7uBrBrPe7uM
         MVCdpkzxbNX0qxLn4qZcXewFtCK0AvvFt1bxtXy7dYFveXDN/BzF5UHmy2wZjshrkona
         25WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727975254; x=1728580054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkfu7OpedYFMW4blTd8tKYx1+2gfV7GpFrrUeC40tik=;
        b=urqNqL2XV/LrXygjGTX2ZM1DdVBvmXbgrNqPCDAzbDPC6oZP4EqRML/MJy/r/FmFE5
         hK/AcMfAb0SPcEU8YEWrKnZI8aPCPVlrnLiX/leD+sjkJKefyFr6pU3LOv+ayMN3YsJb
         9/2ufNpMpLvtJjrCfWqTt5mMR1XXvcYeunbtEQmxCRQWP4nmZDq+DNNeOnwoZ/vOUYGs
         NCaMA4nf+0uZRQwfOX3R5NwJVvQgbAyYHQtQFas/eKn/8wLVBXlOu6HkThZx1jklIbQL
         TWo4qq/WrtQnaJRnHASs2bkuYvsoC5iHImPUuypDgWkMilKF+tGnnXIAhH+MWg+ya1Jx
         oO1w==
X-Forwarded-Encrypted: i=1; AJvYcCUSNY/cNsN5sLuCZSwyJSs2VjslhDkbLlodFV6Jz9Y15pZ/SNfKGaWfxWJ5/TOTkES4S8b+VKiul4+jkiXw@lists.linux.dev
X-Gm-Message-State: AOJu0YyblQt/nx/PwjP4u8ZbPVM+CcLi2SxUYjVRnARxlJpli76HTk6q
	sJ2F90SNruKueaQYMK22dk4tUacCn7IXEfX1VFcEow5uBeC6flo0
X-Google-Smtp-Source: AGHT+IH+lcuitFr2y68/zPm6sfKZoMgOMMWy0G+pLPaWzpY6VYabxGZJbcedKcdXA6Lu5Ya866DR4w==
X-Received: by 2002:a17:903:1c6:b0:206:9519:1821 with SMTP id d9443c01a7336-20bc5a0a184mr110302725ad.14.1727975253702;
        Thu, 03 Oct 2024 10:07:33 -0700 (PDT)
Received: from Hridesh-ArchLinux ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beead252esm11348835ad.43.2024.10.03.10.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 10:07:33 -0700 (PDT)
Date: Thu, 3 Oct 2024 22:37:26 +0530
From: Hridesh MG <hridesh699@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: media: fix spelling mistakes
Message-ID: <hd3n62efwrurrjrp7annnwufgiggmmszjmrqaryibf67dt53sr@mazbztoqrkdi>
References: <20241002152231.8828-1-hridesh699@gmail.com>
 <2163bf83-dd55-4f79-b0ea-834fa7b1f561@xs4all.nl>
 <Zv5XsJd965xdNI3j@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zv5XsJd965xdNI3j@kekkonen.localdomain>

On 24/10/03 08:37AM, Sakari Ailus wrote:
>I can fix that while applying, no need for v3...
>
>Hridesh: it's a good idea to check which subject prefix is used for a
>driver in the commit log, too.

Will do, thanks!
