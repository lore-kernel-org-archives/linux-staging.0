Received: from mail-qv2-f33.google.com (mail-qv2-f33.google.com [74.125.230.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1A3BA25E
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632923; cv=pass; b=vAP2lmUjlmv1THtpnEav1+G5YLko8c9TZdr+OSnEv2Pe1SOaJ3QwYfe97NuLEOz3PidRGKG3GXTaUB9PcuiUTe8jEROI66A2JJqE5OwIR1nUvEv4qfhDtF5QKvdhODQhAB1VbDb3wkepEE0hTrLHHi3nEZmgcwMUcy6gqu2W110=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632923; c=relaxed/simple;
	bh=h7AIpQ2PRk23L86vKYSlNOSeOqSkSjG7f+kXehac0Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twf1x1XtDhdxs1Qn1FfsZ/grE9+CqmnbtTrInzauJ3kmUyOeyfJRf5Ifq5egBi1Dg81Wf+1v0mdnh74io2qVBU/sJkBtzMk3om22ngA/BVFy+KGIC/O0XXl9C2zqPY0bykGNKdC/9ffFnI0wVEo33CkW2dhltiSG5DhOqVBezjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eozq0mYl; arc=pass smtp.client-ip=74.125.230.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eozq0mYl"
Received: by mail-qv2-f33.google.com with SMTP id 6a1803df08f44-90cdfbd3208so4418086d6.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 01:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789632920; cv=none;
        d=google.com; s=arc-20260327;
        b=hE+B8rJLpISjSM4SMGJeqCFSftq95Z4l3/nlbLHXH4031P1GUngbvKOciML+dgGvUC
         w+jwiHPS3Q+LK6TBc3+4AJPjN+ymp04vpkHIJqsi7sAJvDLozEevS1xahXFov216N7qR
         JVlcSMk4gyoV0egJhAlt3i1ddsXoW+MNw5f4AkeePZEYemzGa7BmKF39Df2uMU2YARsJ
         0c6Les3nh+oVmlq0exjQzixERcjZf8Juy72VzjByW0FxTmxIYqOc8zjwK7NGEfXxDpqo
         qc4y+SfgEJK7Z8YcdFMgyyVUxogb2xfdisAJRTZpf8PZw1tijxqx54EnxhOusMJtD9gJ
         I7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q72xsg8VGEvdYIBjoWovFPXundGMPvI7pSSXetg40oc=;
        fh=PBLNiG+XmO0kF9BhDgIp6WwASZ6Pc5eB0h0ApzChmQg=;
        b=HOghhtD3TzL8vkylCqp5AuGa4lUa82JFeidUmxUYVGc2/MLWxzEK8vqtUHFKP1aEy1
         Ign5ULFZdLsuiqRxQwsdnQCWA7Qo1ZnT79eSL/ldp+ossaFs/gXobnQN8xa6kWen7CEQ
         mLA4QtItaZYXKxmRiFN2ENZaoLtzm+xpnosMkJz4ym0gI3P/iFj/JPzDIE6XhjHrncWm
         jJopXPAzBZp9L/FIHktVfC9Tfvjw1XvIBubEaz8AjGe3DvFYPtPdAY3ZH+1zCusBjZs+
         cBGLH2/4x7FX0lOSIZ5PT3LTxkiV0ldHG/RsN73BQ16fL1dOgwmCEWq/ia0tBRTNqN+P
         QKxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789632920; x=1790237720; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q72xsg8VGEvdYIBjoWovFPXundGMPvI7pSSXetg40oc=;
        b=Eozq0mYldSqRjpUMsafXLf8Z+2TQOHt6JxPgiTNb5R7bvl1yilbgosv1ZRQxPOJvy4
         bMhmV14NlkCvWJAOLbIWKru9fPh6eR/i8XOBTBRch6h13sd9HEAWnoEPi34bGqBDMCb4
         W2jJfatdIq/OgJsCBaWb1r1GAzdXSq8+ahmp2dTdgIiB18CbphLNoouChj5C4t0j4q7a
         8S2s1C9dQrqFQsmGRI7siXJX1b17aN8L1xRZus8EIv2G2ozyhoaICGqpbSR1pl8A/WYx
         umgVUM5OYSlWgdeo3xp7jq3YL1lVQre2PJkyn8ku+08+eOenlnpSoiI0ruP9HDr/UHuh
         fFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632920; x=1790237720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q72xsg8VGEvdYIBjoWovFPXundGMPvI7pSSXetg40oc=;
        b=gt9paHVE7U9cMYyzuQjv8tI5rXSQdBoHeEKYrX9SVxfWiI3L3N9jXDdCzsczTgXyJd
         gDTU8JxwdXp9HAVE2lpUs7+bSYPh+5Fhb66uXU7QDoh939b9wudSuMQW2AdPld/vXonv
         WWZ73iNZdT+H/3iEjcYRuJLHBuMfsMdM0XWv1Ap6KxUnpOF2qPswYEUuAfhpet5RhFUs
         UdccO3An2rlFb23RXYAfhL51m/f/Ef1aXvskXmzq6I+fvDkRjaer8FMt8XIbwsYUtF/J
         JlJljJGv1hmlM8zHsVLCM57HtTIC8yL4LKXKY4rTmp4SDqv9K6YgdKiGx84L4TmWf5/q
         cLRw==
X-Forwarded-Encrypted: i=1; AKwUvBwaKsAFDgZDXmUIOqtLaF1isnZc4hVvNhJou83JXP8wJk0BalctarFfh+2BOr8XC86d9kPMS96nv9SexVA3@lists.linux.dev
X-Gm-Message-State: AFuF++mQIZUbwSwfsrFwu5w/fNYbG+lijNZwr3eYPqWwC9NecbninKKZ
	Rbr7sthkw27F0txQXeVbHuKpUfFxOpURNTP+7wOeZv5kklwbwZmXm4cERAGB5cMFgF0TOuRfVQ8
	JXrN3ldCSAnICKxA1bTeKv1iSN52KDrQ=
X-Gm-Gg: AYBFou2oUUh4hN4MBGLZ/FsiWYwBzhm4fYzv/LBTIsNp3tE9YmeDXvbUcSKwcy2gf5O
	Yk0xGDIOwgWxcYSHeNDGMQejd28oWDOw/dnXwGvC1Emty0CDYx9shmUqfKOdUCuY9GRWkZlMQkU
	PWdueQjb27SWBVdfEij6iyUXrqn0J0XQB5ZF3nlXNi+28LWdPEvE4eVJU2NHHkG168FodsdjMcu
	GbdoUgPiib8+Azd5rSnsQvtF6dpYKJF30gxE1G5P29LHkQ6k+CjsDoR8SdHZy2uzWicMut6MEbV
	gnKsInZ0cRXk63Z7z9matN4Yr3f1gYbTpxF1euOVPnidduPzu0/CMrqPC1GEDyy5l6s=
X-Received: by 2002:a05:622a:1c06:b0:530:fe5e:becf with SMTP id
 d75a77b69052e-5327eeab130mr97646871cf.39.1789632920415; Thu, 17 Sep 2026
 01:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917071931.8063-1-palaomer100@gmail.com> <aqubqzKGtpmDkX9W@stanley.mountain>
In-Reply-To: <aqubqzKGtpmDkX9W@stanley.mountain>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 11:14:58 +0300
X-Gm-Features: AcwNN1UVIF0mDjZkSVenAtExu2rN52ZwJmXiIuEv1dHUTQv4TI7j3pN-aKsNuQc
Message-ID: <CAKhZXnpwaZf3hF1XAbO6O4fJZFGoe5Lk5Qsck1N_TU-0B170fw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dan Carpenter <error27@gmail.com> wrote:
> These kinds of changes need to be tested.
>
> I don't love this checkpatch warning because it we reject almost all
> these patches.  If it were new code, presumably the person sending the
> patch would be able to test it...  But I guess it serves as a kind of
> lesson to not listen to checkpatch and also to search lore before
> sending stuff.
> https://lore.kernel.org/all/?q=LPS_Leave_check%20msleep
>
> regards,
> dan carpenter

Sorry for wasting your time.

I thought it was an issue.

You can drop my patch.

Best regards,
Omer PALA
