Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06BB28E3
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 08:47:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y16so8154676wrt.12
        for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 00:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8yesRaMT9U9EPQtxhglkNQFwFn6THQr7croFXK/hL0=;
        b=BQCPMqEU+tav4fAKLNTDSFamkeKMJ7PyFG/eqNkTaVocPgGaeu/o81Az+aFS4rY3vQ
         FSBHdHxuoVzNV8GkFNUgw/AR27/L+I4vy3cWFcFJOWSAStt4QKCZYPyZXAJPi1CykqiD
         U59wQtAxRyrvoK5ogzqb6KRiW8Tg9Qn8RocmZa8+qB7rvfsJ1eO8wNjiiPNlJgUcvTt4
         F6sI5myF3P0JhBD/CCq51HPwdfp3T4vqc4s9zl0fs6QFjgeeLQWhwXwyyq6eGU5mMlFM
         89lg8x7T+j2fx2JVpyoXh2jWLvMQk+eEzX6QhIunNZhiM1i24r+U2KLW+T6/RZL31P7g
         a74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8yesRaMT9U9EPQtxhglkNQFwFn6THQr7croFXK/hL0=;
        b=aa2k0eTyKF1jBHibtxJtihGRnQOVsuw5Cdi9DhyB7XB/5FYitryzV7cClXCLbVUdCH
         IbWo0WY+x+ene51OXWe9uk+U1wdadL3kXFNt+A2o096cFWuNGw/LPmNNdkOJm0wJkUO4
         UWlEblYyUHmDIlCNCw4QiVIRh8wrhjYSG2nQwEyTX0LD1ngY/p5hXV3DxzpHAjVSG4vz
         j/+Didcbqpyg4GpYg8zugvXUowuAAO6bSFeiP97Z4xZMsvBcf6guAjygRGSA407q+Zts
         D2p8m24KVj7rtipYIgw46qZZWZ3nDgBVIgRR3D6NtH3zxKT08zF80KYAMk/NEeQTLtQa
         eKGQ==
X-Gm-Message-State: ANoB5pkNfRaluVjMl/rv5Qa1mgU7ipNd31XjvzVyTZwFvTbfq2Qy/Hju
	SZQflOP8O4WYpgpOw+EKvoI=
X-Google-Smtp-Source: AA0mqf52m/asu+x56hmdWbfjzZRDrKndKiYuCi/TRdN/w1uQoxQ6QJzkkUQKyRh1mtaHb/YpPt64AA==
X-Received: by 2002:a5d:4d09:0:b0:235:e330:71ba with SMTP id z9-20020a5d4d09000000b00235e33071bamr3673651wrt.213.1668761255990;
        Fri, 18 Nov 2022 00:47:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fn25-20020a05600c689900b003cf78aafdd7sm3687144wmb.39.2022.11.18.00.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:47:35 -0800 (PST)
Date: Fri, 18 Nov 2022 11:47:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kieran.bingham@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Umang Jain <umang.jain@ideasonboard.com>,
	Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/3] vc04_services: Promote bool usage
Message-ID: <Y3dGpMLmXxFicE0e@kadam>
References: <20221117160015.344528-1-umang.jain@ideasonboard.com>
 <dd05ca8a-c60c-a56f-66e6-9892cb933315@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd05ca8a-c60c-a56f-66e6-9892cb933315@i2se.com>

On Thu, Nov 17, 2022 at 07:11:41PM +0100, Stefan Wahren wrote:
> Hi Dave,
> 
> Am 17.11.22 um 17:00 schrieb Umang Jain:
> > In commit 7967656ffbfa ("coding-style: Clarify the expectations around
> > bool") the check to dis-allow bool structure members was removed from
> > checkpatch.pl. It promotes bool structure members to store boolean
> > values. This enhances code readability.
> > 
> > Umang Jain (3):
> >    Revert "staging: mmal-vchiq: Avoid use of bool in structures"
> >    vc04_services: mmal-vchiq: Use bool for vchiq_mmal_component.in_use
> >    vc04_services: bcm2835-camera: Use bool values for
> >      mmal_fmt.remove_padding
> > 
> >   .../bcm2835-camera/bcm2835-camera.c           | 30 +++++++++----------
> >   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 18 +++++------
> >   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  6 ++--
> could you please check these changes to be safe? I'm not sure that the
> affected declarations are really internal. I'm afraid this might affect
> firmware or userspace.

The structs have a bunch of kernel pointers in them so hopefully they
are internal.  Otherwise we have a different sort of problem.

regards,
dan carpenter

