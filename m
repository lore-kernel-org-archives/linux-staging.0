Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D33E10E5
	for <linux-staging@lists.linux.dev>; Sat,  8 Jul 2023 06:43:03 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7866189cff1so97900039f.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Jul 2023 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688798582; x=1691390582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zXbxOrtc/7HExwdEy81ap1KW/6Wb6IjSa8/lqjdTN7k=;
        b=bbNkaqu94bD3Z8Q3ops5q4L6MtwCeLvnWqk7bN2rYslLjjWTN77P7FrkdA6+Tf2RS8
         2jupOVYIpsmJFoS9kjbZKQBcIIyY1PBUn+FQcE7QPyjcvo4kMbi32ozLIUHHI5/AREJH
         BR77pXtBNSoLbeOmDsY/xwXGx+R6Ve7TPw8QzuiT2LNae19i05vUpnQ+Ltul4zPIOul/
         dnqrGI0TqoLxXkOhFGaTHfgKVIlzsu8ajkBCmHGFV8n8ZWE5VYp67Mk/Bhmo+lFClVsA
         fVzQMAAUF8cWQDGUPoKTf1UXQK9ITrhL8n5HN5vA00yTgQ1j2dSWFK82uzjGz9NIqtz/
         iD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688798582; x=1691390582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXbxOrtc/7HExwdEy81ap1KW/6Wb6IjSa8/lqjdTN7k=;
        b=JWoRTuho/ENsENTi2G777gyonsQkccpN4Bre2K/evfW6wW9H48HQKSCji+w4Ohs5uV
         XHt58G4zQkgxVNd9UGMaOX4JXIajCMFXb0SzaKiT4byK9Q6OeWDbcPMcoUNeOtPvy6TU
         v6zy2fS4SfMBUEaAp47KrxowIB+m9kTyreXMS1dpMMQ9kowJGiRZFRZPD44UZ8B7vBA7
         e5xt9QSm4AG34CZxgQ6OautGqBvoeImSnycZ3RqC687lHqcbaF2CmVRnyIdoTp/AkGwu
         AWL2fBXz0K7wp+faBtgn24y7e9UPXnGCXpE1JfQCa1YtYHT6bGpJbKcblc/3hJdTBPUd
         6QCw==
X-Gm-Message-State: ABy/qLYqHkYhYsiceMUJtklxvyykJKdbH5Ra6HZsN+vmYshsFBCxPB48
	xkPmvrbj3Th7/2Sizyp3Fr4=
X-Google-Smtp-Source: APBJJlF9GgTcKPdXZXqu1n+r10Z6nI6NKh+tsarmEYMX+VBnwQEtjev1lE+nuiaEL6y2wlVb0BL+GQ==
X-Received: by 2002:a05:6602:642:b0:786:2498:40f0 with SMTP id d2-20020a056602064200b00786249840f0mr8507275iox.10.1688798582264;
        Fri, 07 Jul 2023 23:43:02 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
        by smtp.gmail.com with ESMTPSA id g3-20020a632003000000b0053031f7a367sm3736170pgg.85.2023.07.07.23.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 23:43:01 -0700 (PDT)
Date: Sat, 8 Jul 2023 12:12:56 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: Re: [PATCH 0/4] Trivial code cleanup patches
Message-ID: <ZKkFcMCGFhD5Q1WU@zephyrusG14>
References: <cover.1688299890.git.yogi.kernel@gmail.com>
 <8e53be9b-8b47-597d-1538-95733eb16cac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e53be9b-8b47-597d-1538-95733eb16cac@gmail.com>

On Thu, Jul 06, 2023 at 05:30:27PM +0200, Philipp Hortmann wrote:
> On 7/2/23 14:14, Yogesh Hegde wrote:
> > Rename variables in function _rtl92e_dm_check_rate_adaptive
> > to avoid checkpatch complains.
> > 
> > The patches are required to be applied in sequence.
> > 
> > Yogesh Hegde (4):
> >    staging: rtl8192e: Rename variable currentRATR
> >    staging: rtl8192e: Rename variable targetRATR
> >    staging: rtl8192e: Rename variable LowRSSIThreshForRA
> >    staging: rtl8192e: Rename variable HighRSSIThreshForRA
> > 
> >   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 38 +++++++++++-----------
> >   1 file changed, 19 insertions(+), 19 deletions(-)
> > 
> 
> Please use the "staging: rtl8192e:" also for the cover letter in the subject
> for the next patch series you are sending.
Ack. Will keep in mind for next patch series. 
> 
> 
> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Thanks 
Yogesh 
