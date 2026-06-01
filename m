Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92C39D3F1
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312344; cv=none; b=O0amk4bMLIRCU/raiSAeGfS0zjSBF4OHHC8EraU93P7zfx5Q1w7VRmpVqENgM08Ow9rjbTj+4IbHUojhWYOcnJWiveg+Vfpe6gJ1nBHb1+XwXeT96FH/1M89sV1DvzsehRG1sZOtYKHeBnooK+cRNmlemRYUtxXy8EwVmupQ524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312344; c=relaxed/simple;
	bh=2kVjzgJhIizFfuEYAIfPUfgr7E0a2NPpngUcGQybYy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2dHdTApeTD3uEXjJj53qRlWRaOQOGpOBUXUbebH6hoQ8TEWqU12c+6GV+MNrZhIhBl3TMrgMmO8CLczWjG9xImfGEDZdEsxGrEyg4r3ZpeGuCaArfMD5Lz8PDLLFPETQ+lH0RxaYYGPWuJtECpvA9OU6gilAq54QrULx8lNL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frrPZo9E; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frrPZo9E"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68be16c61d1so5557453a12.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 04:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312341; x=1780917141; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TgnaRVqfZTZla4JliJ2eTss2v12jmTs6tQc9EqQ2PA=;
        b=frrPZo9ESvIIO9z4QHMRc3kqW4t00rqtdH1T2avr2TkpFpnFPrLLIGvifwLInjRKa8
         Kp2zs+9uXOxhqmeKCP5ErPnx6w8j1b/FztYqv6na8v6kIrunNc1pP1BzRgPVxQc9IXRo
         vASjfJc0qFqa1jey22OysTMF93JNQzbEYC+yLmMz0XMgT1K3jFY1pfvU4dRfiyITRmEw
         fE6iC1b/Yzn/pAIE3JLFkRC386tNOkfh9z1+sDBEsumnMsdQIQM1RrYuxNnsV85QGPMA
         65rRP3eI8E/yAkfrrebbRgRciNlAS0P4M2C9Y6rctq8a8DA3fQGObTKm8HGOxyrhbxP2
         wTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312341; x=1780917141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TgnaRVqfZTZla4JliJ2eTss2v12jmTs6tQc9EqQ2PA=;
        b=F8AZKE1SzgPgfsspxLVav77bBJhBIymZouzTyH8wh1itcBYrr9xC2XXMSKOavQT6x1
         fDFtUZ+JQAlKTH9j2kfnW+QIlH6Svl6fktDYo2v6HbUUQrhjQLMOKXv1uHbunB09BB7t
         pJgaOdAY+nfYviqfyo0tTS2oWqxaAeYEgPWuC9Hb2VKwYNeVBY57kUMsY+iJIAsqGThT
         hrluDnCLRIqHqcYMfaJC6sU9KFRiG9Ukx9Fiydqj5wBw2szhnH+E7Hz383pKklLMYJnE
         v3LE/oPsOTrIAxo1sdGGk48YO1bCTXp+ffxktRQ7y3F4YxxaXzSaLXaiXl5cKj2SM+B6
         CCnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FwLgQ1KwOr0z7J6rbVPsCKe5fFCRv+FldbDf+6RyLdjIpPBDVwlYCm44+8iBR/Td1qz1uYnghkAwXud98@lists.linux.dev
X-Gm-Message-State: AOJu0YxhMyu9GxY17zOq3FmAv3YIshJLwnxIT83OQUeOxt6vPccmSV4J
	wre9zra41DP64UJWDN32Be8pi+Od1UOzhuuHWJUOsTGPwAf3WgRQLPfl
X-Gm-Gg: Acq92OHWwNCgZvgsTbZRXa6bSbMpItMlkKaQbu1iOwy8L5dcfWchDuv8s3Drx5KBx+e
	Alk5nM+oft0WeV7/iTVRW7MwX7Wkq9fX5oSfFcdjmkTqGfKUlR3RE5HieiSnjSdtUsxB8UHpJjC
	i5VfS0daRcsfBAwv1r34mdbX7WGjgtRxXytXP18NJU8XPpnUPMxaSACxyak3r4tV4xjSVfLL60h
	w5i0nEPQbx6BmEzug0nN2E9BTeS7W7EBVaOa+ryVWKJl0NpKR/XZdtQkp/IC39KrNcoo/zy8dPw
	iUR7O+liunP6M9BNT7hiRyqWZbOZZftaapTuV3twTL/i4GY6LHOzYTXLCWfQvKGpohnK0klN8qH
	wBIlDYSEMZRu28ll7SA2uvzlMgEkk6cFZp8X/7ImoFlCWkqgVffSRMxX2aKSz4FI3QE/yaW8X0K
	bnpgQVKYvpQSr1EMRGQP41P9sMLAgJbTi9hg==
X-Received: by 2002:a17:907:d9e:b0:bdd:45d9:8e15 with SMTP id a640c23a62f3a-beab3851adbmr641529366b.15.1780312341514;
        Mon, 01 Jun 2026 04:12:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed25666221sm108317066b.29.2026.06.01.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:12:20 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:12:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Colton Spurgin <colton@coltonspurgin.tech>
Cc: gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add newlines to
 sysfs_emit calls
Message-ID: <ah1pEXtwjVpdHXs7@stanley.mountain>
References: <20260531005007.98382-1-colton@coltonspurgin.tech>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531005007.98382-1-colton@coltonspurgin.tech>

On Sat, May 30, 2026 at 07:50:07PM -0500, Colton Spurgin wrote:
> sysfs_emit() format strings should include a terminating newline.
> Add missing '\n' after 6 formatted strings in show functions.
> 
> Signed-off-by: Colton Spurgin <colton@coltonspurgin.tech>

This checkpatch warning only applies to new code.  For existing code
you risk breaking userspace.

regards,
dan carpenter

