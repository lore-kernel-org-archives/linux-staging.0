Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881CF70
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 05:58:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q2so1223252pfh.13
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 22:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=quQuju5BxZq7ggpYY/T9Kt5b+6CSVPIxgVITVpTO9KE=;
        b=dmczgfn23HkMnD/1xckytRmAxOEBCMjhQol0JKvon7mdsbADKsibwKa5LdREdNxIMz
         UfXbyix4s5gKro/VyECzHGwpKfyG61q4jlmwunoSaRm7BoieCKo4hXGntOI1/KAKntKb
         iK5FV4YscaerZZG7FOqsNs9A74r0/OMwG3QLOWC8OE2k3H5gD2p+ObQi353s+I3bm0UR
         5A6QxPH53jcTi6+c92wsOdEahmKFEfKxt1qHRBXZkG5lv9/JRfFdv42bk0/vJB5pZx5s
         5xOgDJtZ0iiyO9nNnKowPc6xjSUTPxw/OBqMUz1jKmh9BHJwZ5xGX/yTS8vqJkXyDqed
         6vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=quQuju5BxZq7ggpYY/T9Kt5b+6CSVPIxgVITVpTO9KE=;
        b=dCp6L0HVXCylbQUg4uFVTw4yYu2CszRko2cRWhhMdiicDfulsXMl2TCBooxVEq1KWa
         gYGdHqg/550dqioKuS5/QbbhLlRCwEt6II92wotqJN9mf35hpYWapHAiT3Nhu1QL9EcO
         sd13LHo3r5kmrth26XM2DZC5fjtCo8fKis+mSaULY+i0iGm9vA6F3qaFGyhU0QRX00it
         8EFqWVxmPhct0JFaA7pYVrNFlLETN5hnDEEKTk9zCu6yYCt5gf6Mwi/MGDM+M0C75fxt
         QYBhn3gPwhYFL4kedKoGng26QpKWuGRtc8psEH2Xw3QildvWYF5GGM5l0CJif/LI+1bg
         hVLQ==
X-Gm-Message-State: AOAM533FZ5o5mfmB30QJiDXxEVcZtW8fen0qful12fIfMJOigsx+Zfms
	oy9HjV8s7CM+vEe2E6DSULw=
X-Google-Smtp-Source: ABdhPJx8Caznyp43VzJam8uwjnUsmT5GcJV648F6RKyUhtq6e6ZR5fRzb9XJhVzQTYjyBE2FcxJ0Vw==
X-Received: by 2002:aa7:8692:0:b029:28e:7bfd:655c with SMTP id d18-20020aa786920000b029028e7bfd655cmr49841220pfo.81.1621058321063;
        Fri, 14 May 2021 22:58:41 -0700 (PDT)
Received: from fedora ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.gmail.com with ESMTPSA id a10sm1082534pjs.39.2021.05.14.22.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 22:58:40 -0700 (PDT)
Date: Sat, 15 May 2021 11:28:17 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add declare_ to declaring macros
Message-ID: <YJ9i+T5IfaDwdaBX@fedora>
References: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
 <YJ9dDwKMKkifeICJ@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ9dDwKMKkifeICJ@kroah.com>

On Sat, May 15, 2021 at 07:33:03AM +0200, Greg KH wrote:
> On Sat, May 15, 2021 at 09:11:16AM +0530, Shreyansh Chouhan wrote:
> > Prefixed the names of all the macros that were used for declaring things
> > with 'declare_'. This should help with clarifying about what these
> > macros do.
> 
> Thanks, but I think I will leave the code as-is.  It's a good "test" for
> people who try to modify the code without actually building it :)
> 

Oh. Okay, I will try fixing something that might actually be a coding
style issue this time then. :)

> greg k-h

Regards,
Shreyansh Chouhan.
