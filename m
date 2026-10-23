Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772302;
	b=vo7qvrlK4+YD4P5xq/wONn5TiGbdQ4LCgU5mFEcq0qiiCTeoL8qpDaRjFu6qxYCggt9W
	 DjTQlli17GZ1oaF8toO/Fcnxv1N77J84ZD2Nv2itVFPiZUMQZw3RxQiL6AUdrbRCfeEpR
	 bzvzld3zqEaA8fhwVN1iVZ6ZMCiyJ3OCMrcmpVr3J17g622BXXrQsWlTMes5TqGp1CRX4
	 XqoLQIbZPKHDtuG9T5YxpBI5Er6mI+rjVqotNFYU0OJvYyN4IRdcJaSTEo6kufGvZ1vjL
	 ckwxESezkAcgnqStuvfs8mNb6/KRe9aAFTWygRsCEcBwQzGkFYXUvPMTCVNo1ZdNtyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QP7Z5nq9f3M+wzua4Vt0AE8lDl1n5BDSlA4IpFM8kg0=;
	b=4uzj+edDq2XVpQLYfFaqvDZVGX3HWCbpYIRGvgZyY5Rpknebttnmb5msPCMJ0bM8w0fT
	 qHqORtp1Z3P5ZfP6bPg3Q4VXf9dER2p22L65bAH4wvc0vXllVSCpZl/1KGyZLKzgAhJHW
	 kOrKEGNOmpYmx1GKk5oYYRY5cVtoBkIlc52evNw3ypRTJ3/ZeKYJW2cZBhLvJZFYL7o0A
	 hiEEPXWiPyxrD13EqDACDlkS2cSs3r97H/DoxdPEhVqVxZAwutLsdb4oK7Qrc4XjBaWPl
	 04egFoSmE/Q71rd7lc4i5j6vEF0xzW1bD6vpqXblwFls0Z4Vvz7UxR8fA/2aGGsU0sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZCmIWuOD;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64227606A31A
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 16:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64227606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZCmIWuOD
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso635268f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772301; x=1793377101; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QP7Z5nq9f3M+wzua4Vt0AE8lDl1n5BDSlA4IpFM8kg0=;
        b=ZCmIWuODC33GV/1MI3QEIhOJBDUYEe0+kSFZij0MAYnXd7ALFiDIjrwf16ERFuEtsF
         8eiboD8i+s7pS0xPQX6AITjt3DgJ0V950hZ8dZF9RTtRQeCZP46WXgj1lPx5HzaDGL3I
         tDdduBlpB+ub/USsqug8FWIMBnEOFGbxo7rIV1J6kcu/piLqOAVg2FH8YuWr9jDIGAmb
         6yA2ApOytwu6JAIGwH5sQJaIO4CyGCiA2skNrpnZQKERkfokmL7VOTSDJr5aKQ0kosvQ
         zW00+g9rLq6eK7U7ZYPTYAwn2+jaPbuk+qRUvVshTfYTaKq83JD3+Bk71pao84HPxlBo
         GpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772301; x=1793377101;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QP7Z5nq9f3M+wzua4Vt0AE8lDl1n5BDSlA4IpFM8kg0=;
        b=cadZ4aDeGlNuDPEjZ3k1LD79WTCQ91Fdo8LjiFpy2IMSfzH9ltLe7Bwp0O4bPx/4vu
         QIUHwqITrOabJ+4Y5E3AuktB0fnsNAcfb7CkoeTnCwxgL/vASZNY9d8hGnXMtLjVKGnP
         +89bi/wZN3lrFp8QuhDQSbS3R/OZdLd0BCdAzeScwHpH7aVoiPfUIRBI9Yup8eYs8kqb
         VEKcDGiYrjgiqWA8JgNDdsO0et+FVjrRH/c7csvgvBdbYuP9yonGA1sxfiDaMfH/vY0e
         oVSSWmBDzuK4dMXsRnxaaywIjUHDiDoBAFAQ4RIe2SpcktWtKaoRDy+o14JtxogStKPG
         Y7KA==
X-Forwarded-Encrypted: i=1; AKwUvBxbS+eY440DwRbt5qNqV+xtKu1ooAx0BcsmRYLPjxixUht/IJkqrpiSZPd0VGBDOJCZDHh6vsU0lTVAKVB3@lists.linux.dev
X-Gm-Message-State: AFq9FYJj30KR+xynZuWVDCt1wQyqnwAgITNOp2M8DAE8ZjitMrVQTg5z
	efzW2QA/XwWX/DUf2Iu6LqMi/r23C6afbCEpTx1lENq4z2P8Pb6B3Jaz
X-Gm-Gg: AYBFou3dm2W61Lmg8AsOgLb9gZaHy7aRa1UCS9ypBQT2qMOcbiJzARTIEwZhZyRhCZm
	DsMlM+tJIFufcma7rCLLNyHeCUtp0zGdh+JtrDvSlcwhc0CZ5kV2T9MhYojqmGKaA5PnK4pVjEO
	+8gqH+uwB8nAxW6CFA3aukAZafm1aPsmgXSkIuz7/wQrRRswq/LUAchcVONzmJM9d9stdupF4KH
	Mv6O8L/WHQr+193ZL7dA0bYY14KXdiY8pi03iO1BJ9jtJHzpwvGdGKrBS4XQa0SFHuSb1ATrNh9
	YVERmeM3BGNPDnKzKxlFywkz5FFg5m9rPBcqAA5t4RDJBLAKte4d2vHxRTa+ep5IQP/dm92uoL/
	8WBzR0jbFBHxVt1TSylzRShmykkU1YVh1jgcCeDkbhZe0UZ8Anl6W39J7IBYgBpqPcXNjsKYq31
	s3F94oLkDmYCZ0NUx9G2fYhoCQT8nTufhetrRzoaglLXnPM4YztsIyXJhqoBosGATHYFXWxxQK0
	1VwAGbQZDLunB8obnviqOmXXZag/XClL3oM2Rg/KSdALyAqv0fn
X-Received: by 2002:a05:6000:2005:b0:48e:a13:7c8d with SMTP id ffacd0b85a97d-48e385ae732mr5020513f8f.49.1792772300560;
        Fri, 23 Oct 2026 09:18:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d421f65sm738672f8f.48.2026.10.23.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:18:19 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:18:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shuai Liu <847807867@qq.com>
Cc: SudipMukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: sm750fb: remove unused macros in
 sm750_accel.h
Message-ID: <atuIxyy427lxFwag@stanley.mountain>
References: <20261023141143.183061-1-847807867@qq.com>
 <tencent_6CA7B248C9B3374DE2DA88094C98BB5F4B0A@qq.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_6CA7B248C9B3374DE2DA88094C98BB5F4B0A@qq.com>

On Fri, Oct 23, 2026 at 10:11:42PM +0800, Shuai Liu wrote:
> These macros are not referenced anywhere in the tree. This is part of
> the TODO item 'refine the code and remove unused code'.
> 
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---

These are macros which describe the hardware and they're useful as
documentation.

regards,
dan carpenter

