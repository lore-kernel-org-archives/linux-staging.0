Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966213D978
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 16:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719939201; cv=none; b=cBqhE4bGQ6OtOBGR6SOEQaK663SrkJW9GbsR++eBpO9q+TJoz7juE9dRs2I4ik5VXfT3deuCrkpH118UHl03ATXClZLiQG8omHsSxtcjBCgbFMTDbVsLgPzvX5ZCB+ChcFPRr/1rOg4GMF56MzSpx/1jBZU1rOoHFygCre7dQ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719939201; c=relaxed/simple;
	bh=yFh98GxSkvulcfNbNtIuL6R8PH120cpRqETG1rA9rtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo4k6plDiNRLn+sY8jBz2XyQmsZAMYv3phU5+5iby/SaDWDfdkIPFgfRHTFbD9qd2wfTQb/6tq9X2DqniwqaaMhVL465Mv0/H4XKan1R5ZKUfmEGtpvZ2xobbALfXRxkjzRSgA50sjoEz3kLDOGD74HVxCKJNNY1xTDCN0gxyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pO7QMioW; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pO7QMioW"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c46c8ccfa7so244135eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Jul 2024 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719939198; x=1720543998; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqepe17Q+9n4KvmO+hM8P/+YUKJyz8zRz5nvZkFk7rc=;
        b=pO7QMioW/LuA7Pf5554ut7/y4wjE1JneUBZUXRWn8DBobVqUPVfYLu+Hpdtg15UNuM
         /OLXvRcFRHV5BjxQfNIDUxObLsSMBIuY9i1XAYiobYWR8cmNMHlzIWlJPWhHYGZ7YO0b
         AlMSlTt8Jc+WNRoz8H9RUZ/Wcaeox+bAH9v7lu+UEAi0kQUrH7QkqURAB6ettpC5km9y
         AAt1AgIciwf7u3aUiXJ+xepM8SuMFA1y+xUfWOE9oWy6Rv862OltHdNKNnrj1Vjmw1lD
         sUOaIUE5GYy/tm54GgVeBKSEwrItsPxkOUbOVgvK2l/IINIWtEEcjiERbwbWYdwKlCJt
         XlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719939198; x=1720543998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fqepe17Q+9n4KvmO+hM8P/+YUKJyz8zRz5nvZkFk7rc=;
        b=CDnHJ6LhfVREuTLg80UzoMPMB9ISmFKJvIVrlItsT5a1RdGOh19RmodP/ypcSub6mw
         Jjb7SV2vBIGqb+pLZfp8Pj9M+ZFAuJPaav23V94JLH3iLHQ91ramAoEjKK46e93bgZt7
         V343DYy9XGsGBlMCsVN/prWtlT+huGPXkzjEYRntZwy2VKyx0cQoVB0ONaXxOsqSEREt
         cD9oceqcahZH899pItecOj31pTidhJtyjrZQJ58+KaNcCKUOnXpFIJe3csOXA9QI4zAk
         ACSvrRYH0Xb7ZzqAy0qTTypqEt9AT4I7dv7HNcKuhJhwm8RP4PAerTbUWSeRL712qTvb
         nXng==
X-Gm-Message-State: AOJu0YyCmzji7So79MKb3KkFaFUz47KNGFsMhDtCme8q1R+dwVIdkVie
	X68dQagiK/UFRM4GYHuDKGP2ANiBmB6nCWJ462LBWYWVcxUpnDdqEAnFN1BYNoM=
X-Google-Smtp-Source: AGHT+IG+AEhDYwowF+f/q1NoCJyLIfs9VJygu2LdkAcN+2Xgh9CkdPEosab6yNPEJ2T4YQYqNXb1Hw==
X-Received: by 2002:a4a:55c6:0:b0:5c3:474:4bb3 with SMTP id 006d021491bc7-5c43929cfc3mr9891730eaf.8.1719939198555;
        Tue, 02 Jul 2024 09:53:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c41480bf25sm1457288eaf.3.2024.07.02.09.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:53:18 -0700 (PDT)
Date: Tue, 2 Jul 2024 18:53:16 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 1/2] staging: vchiq_core: Bubble up
 wait_event_interruptible() return value
Message-ID: <6134b9a8-cfbd-4f4d-8487-1e01ac5d4b2b@suswa.mountain>
References: <20240702164256.754391-1-umang.jain@ideasonboard.com>
 <20240702164256.754391-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702164256.754391-2-umang.jain@ideasonboard.com>

On Tue, Jul 02, 2024 at 10:12:55PM +0530, Umang Jain wrote:
> wait_event_interruptible() can return if the condition evaluates to
> true or it receives a signal. However, the current code always assume
> that the wait_event_interruptible() returns only when the event is
> fired. This should not be the case as wait_event_interruptible() can
> return on receiving a signal (with -ERESTARTSYS as return value).
> 

I'm not sure I understand this paragraph.

In the original code remote_event_wait() returned true on success and
false if received a signal before succeeding.  None of the callers
cared what it returned though.

> We should consider this and bubble up the return value of
> wait_event_interruptible() to exactly know if the wait has failed
> and error out. This will also help to properly stop kthreads in the
> subsequent patch.

Now it returns a negative error code or 1.  Which is ugly.  Make it
negative or zero.

regards,
dan carpenter

