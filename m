Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BA70
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 11:29:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id ec13so3116803edb.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IjBPgUQiBzbKNMi/FqQflOksi54xC4hLPMuwWM9yuc=;
        b=Hi4y/RvWTwSkdoxFsy+D8hFllLfBttHMByIe0A+ZzHr1MI/bW1Wpwb/pvj/WX97q4m
         zvBHSHQpXBGWVFhoh9wC1WC0JZejktthiHb5p6DuKAW9lbZBhZ/ofpMeDP+MEYcqH0/m
         P+AKSMJzg6a6mYHdMbx7BUeTBWzh1bYh4ix3MUBC6hJUuZZ/1C0PFB55/seEQCo0i3Gq
         D82ueVcGMChaezq5Vdm6+dMADmNtQxBzkb+YC4ThTt9D5cMWfsyYXEnc4THrW9M0GO+Z
         3Z1W8F9bfkIO28/KDi6+KTFw9vo3cQW3yZNuLMA22RKRPLre2aSZOnHsfJg6uJ6zvpSA
         ph6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IjBPgUQiBzbKNMi/FqQflOksi54xC4hLPMuwWM9yuc=;
        b=sn7jHb561lMpekwk2tPjwhaM8g/Fru6N8u7D0EMt8I2i9dAPPBGXg0f6RJzl005z85
         /75ff+0/E2KL+52VOB1o5L0kkC/kL7z6uaLqpqqPQuXzb0UCfl3FTPFRXApI942xzlQL
         OAX01FPhYfM2ea5RuRSuE7dTBuQO8PWMDX9Iujfu+JrzftBCe9UtmU+VsQ8Hdv5Lv+R0
         4W0/8u8tHNpIU1bSlrWzmmTCRo9RTMoF/gbOS0UBseaLkU5Kwd/zXPbV+GVBAg4bIKXm
         xenB/WRLak66I40Y4J2yooJwLNIL5LXqnmXtEKaX0yKkkBfqMlLnYgqo6wFigREmmp4t
         FFug==
X-Gm-Message-State: AOAM5304LCM8FW9ffPljtg3ajCqaznViubJ1sxfGMEikpU6eEMAhb06o
	U7ZNG8leRBlIuf3ePjH/JKY=
X-Google-Smtp-Source: ABdhPJyH52ECuoMPPc7gIRHzfao4GCsT7/i1HKTewFXp+KFg9gF4auaOMGtJHRxJQTTWYoYNDVgm4w==
X-Received: by 2002:a05:6402:2073:: with SMTP id bd19mr2831702edb.262.1628076573017;
        Wed, 04 Aug 2021 04:29:33 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id c6sm579413eje.105.2021.08.04.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 04:29:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Fix different base types in assignments and parameters
Date: Wed, 04 Aug 2021 13:29:31 +0200
Message-ID: <6010274.OVh6iHOyDd@localhost.localdomain>
In-Reply-To: <20210804095839.GC22532@kadam>
References: <20210730181452.23062-1-fmdefrancesco@gmail.com> <4550286.edLFIWPnRF@localhost.localdomain> <20210804095839.GC22532@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, August 4, 2021 11:58:39 AM CEST Dan Carpenter wrote:
> The patch was based on the faulty premise that the original code was
> buggy so I don't think it can be fixed.  It just needs to be reverted.
> 
> regards,
> dan carpenter

With the original code, GCC + sparse emit a dozen of warnings like the 
following ones:

drivers/staging/r8188eu/core/rtw_br_ext.c:693:101: warning: incorrect type in 
argument 2 (different base types)
drivers/staging/r8188eu/core/rtw_br_ext.c:693:101:    expected unsigned int 
*ipxNetAddr
drivers/staging/r8188eu/core/rtw_br_ext.c:693:101:    got restricted __be32 *
drivers/staging/r8188eu/core/rtw_br_ext.c:693:123: warning: incorrect type in 
argument 3 (different base types)
drivers/staging/r8188eu/core/rtw_br_ext.c:693:123:    expected unsigned short 
*ipxSocketAddr
drivers/staging/r8188eu/core/rtw_br_ext.c:693:123:    got restricted __be16 *
drivers/staging/r8188eu/core/rtw_br_ext.c:698:99: warning: incorrect type in 
argument 2 (different base types)

Do we want the above pasted warnings and leave the code as-is?

Regards,

Fabio






