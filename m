Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612FD39852
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710325067; cv=none; b=pw7sbg0xdmM2d/V7zwd2WpiGkyQBpt3lLWlcnd2GtBgYNMbS/DyvaNBj9ezDa4uxpZDMReJTItM2h2PxuFk+ZPuDoSCCwHeaLb02Yfc6CGLokdCMA3tCwRDta1NzJt0hWDe1pFTYq3d6ZcagWRdgfKDOw6wcCtjQ+NgdKaslpnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710325067; c=relaxed/simple;
	bh=LoZmgljt+ac9BD9RLPwH0JEFx6pL0A4Uz+wUw5jJROg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzSCRUFxsw07+3O1F9NSw3oNfUGjms3xGSEeEQdq712WHJyE1oYzR7nJw/KtFSvbwpTBKkOzByrto6GMX98t7TPwXNNE+ambk8NV9iEvWnrG+hkvzJ8qKzyO50SdfKkRZG8MHeq79zkOFKZkFowAJrnICV3rgaTMduwq2ZWFvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HzU+ueEe; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HzU+ueEe"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5684073ab38so1310838a12.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710325064; x=1710929864; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5M/ORIq4sCwrmX5HQhBLxTr5aGDowKuZzCR4YxxCzO0=;
        b=HzU+ueEerfLbjOvPfKVxYzsDlznS4bmA0Y5ANFpwTNBbo7tOdt7Wr2/XuHKCD4/dTd
         +Q/HBGZLxD6EdEasnUkHLjxG9x05/Au1IJoA2rHs/JN5Y1+QCGViXJNuoflln8KwM9rR
         +Dtv3Y3JLw7DkvvihGCs6bQGDvUI8RUpjq7mBIOVRBNPeaMfeoaOVjSOtsl+8T/uXozH
         CG+MPV2A63QZx2bsnR1HstkjSQLExawVSAYcV2i9XKOKLohOUpTKhCF+HmC4faHV3yGR
         fa/WSKtuOXo91/L+tbDudxAX9/9kZxJjQkH9pH/fVoEtuaRUVFc8YuQc01mBy2NupYah
         44PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710325064; x=1710929864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5M/ORIq4sCwrmX5HQhBLxTr5aGDowKuZzCR4YxxCzO0=;
        b=F5l73lbk1M0RV59kzVSeTz1iHNaNh/NXR+KA6acsGNuxl2dnQJ1d8CsJDm32THIChW
         UZGecx0iTCCp0E9vL9oMF5bzx/xF6L7mxFsVLNcyWEryQjkdmnQX9MKsM//WpSO1U9+u
         jGHuD8v/ZRj+SYwNX7H3UJQ+0iL5SvDE/VZnryo9tNS3toAFFFnhQqhOA9Q1iMx26NZ0
         kReRuzSqd0mXfy0APBJiobgTzQAhRszKCot2px/LWaLcXPOI5s8+juISzXbQp+2kzyMw
         ujyv55+E/0OPbcl3UH6HpnJN5UKxg86KXIWzYWMmjqRr7+5i0A2FQJFmn+fDgr17gwlo
         MWbw==
X-Forwarded-Encrypted: i=1; AJvYcCUkag1GTMKDorpHQnOlJlV7wSPp5ykCJRe8hK5v6l31NTbcOc/Io1gCzLm5yWV2Y29xLUJpq18XKNV0N31QWtnP7zSCUC4wXKIvTut4GA==
X-Gm-Message-State: AOJu0YzNk8bNljV3++2PLqdNzqWZlwOshBimMEFKnxaJ+C8wdTU68CNt
	/zNB+iI0mfOIp7yW6UNC4U731SwKOGSu6m7UY/GJNWIu3OSWQyWxNjaZyWxU+Sw=
X-Google-Smtp-Source: AGHT+IELGqN8dTVBTo97+SZdGl19AlZq/47XPA/TYt/B825Pkr/QYywCASzMf86GH0N80ToFdcXSGQ==
X-Received: by 2002:a50:f619:0:b0:566:6b3e:c965 with SMTP id c25-20020a50f619000000b005666b3ec965mr2314303edn.4.1710325063594;
        Wed, 13 Mar 2024 03:17:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fg3-20020a056402548300b0056889f3cedfsm316920edb.55.2024.03.13.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:17:43 -0700 (PDT)
Date: Wed, 13 Mar 2024 13:17:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prasad Pandit <ppandit@redhat.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
	rjui@broadcom.com, sbranden@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Prasad Pandit <pjp@fedoraproject.org>
Subject: Re: [PATCH v2] staging: bcm2835-audio: add terminating new line to
 Kconifg
Message-ID: <0a1aa580-50b2-4657-8308-94bffb194aea@moroto.mountain>
References: <20240313091259.1413854-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313091259.1413854-1-ppandit@redhat.com>

Normally, I would let Greg decide to notice or ignore the typo in the
subject but he's on vacation...  s/Kconifg/Kconfig/

On Wed, Mar 13, 2024 at 02:42:59PM +0530, Prasad Pandit wrote:
> From: Prasad Pandit <pjp@fedoraproject.org>
> 
> Add terminating new line to the Kconfig file.

Why does this make a difference?  Is it just because it's annoying to
cat a file that doesn't have a newline at the end?  I checked, and it's
not a checkpatch warning.  Perhaps it should be though.

KTODO: make checkpatch.pl warn about files that don't end in a newline

Since you're resending anyway could you add that information to the
commit message?  Something like:  "Add terminating new line to the
Kconfig file.  Otherwise it's annoying to cat files that don't have a
newline.  #PetPeeve".

Just fix the subject and add a line to the commit message and I'll ack
the patch.

regards,
dan carpenter

