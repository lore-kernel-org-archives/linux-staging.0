Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A101FD7;
	Tue, 12 Apr 2022 17:18:52 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so21428217fac.7;
        Tue, 12 Apr 2022 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1MO+MVC56kZBEIzmrDTAZJIjtd3zPAk5txwHxsm638E=;
        b=gZQ3Y+NeEP9WnYsHYan82XhAQmdLR4MoAYCSbsu+ev2sTjAHgsufOBM6FCGYJU6zEP
         3/pVjKBm/n0l4n4QmRYbeKn8rcIf8jo8aU/wEdDTv2h1z0d02KAoQ9RV4vQzITsBeuyh
         ML8muAuO9gykkVbYrJbzdXzwOHKwZElndDEDN5SKcgm4G5174MHF/izLExQEIQONlexh
         vwdEolH6xG21PjvQA6tOxn8mvBAhzHeOA9olSMPX+2SdmH6JQevgwga4LBINfT3Yig0W
         8I1f6cFrA6eb8XFuMqL5XMqaTIhWWS+8hWrkBXbatE9XfCc9zXOLlOAwTX3q4WcuS0hj
         WMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1MO+MVC56kZBEIzmrDTAZJIjtd3zPAk5txwHxsm638E=;
        b=6+E9huXESr+OeXDe1coiG0AwGFFo+5O0YZLgziUDwyxOV+iDdihrsmCsDTpK1pt5W1
         ghf6dB8PSCQpoF3Aids4cIowDIpkapUNUWLpnrFYrut5HHXbN+Nf9z76bdIcTRgGzH71
         Igpoh++oki2RPgH/09IMS3u/5WxzJpflySh4PDqzdtDzlYhBinvk9PgGRYoM3JNpEX1F
         OmudNAcTSH72RQ0ekvQxvxQ/rawiF1VwYAZsGWTyH91fNuHTeCrApnkNIESJp/a9qmTY
         G5aQZRdNN9mRuDXgfIIL8CCR+W7h2Nooh6mGZcanRKakyFICzIaQy52HdTqyJffgwDhO
         DBYg==
X-Gm-Message-State: AOAM532IvOYuc4XEWeSJ5mAPDplYKs840NkDatDgB2gDV7aAJW0ItxDA
	r1mmOhhTr3BQoH9hvq3ijGc=
X-Google-Smtp-Source: ABdhPJwKWPBqgUckZLmmXiV4ZdPDvtEqvyf2VWE1hES3i003XDLdLa/VDYnij36CUwjRegV5hR17xw==
X-Received: by 2002:a05:6870:b408:b0:dd:ed4f:b1c7 with SMTP id x8-20020a056870b40800b000dded4fb1c7mr2652911oap.41.1649783932009;
        Tue, 12 Apr 2022 10:18:52 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id z10-20020a0568301daa00b005ce0f36dd81sm13529594oti.12.2022.04.12.10.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 10:18:51 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <027acae3-29ee-ae35-4448-a56e66383849@lwfinger.net>
Date: Tue, 12 Apr 2022 12:18:50 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: correct multiple misspellings in driver
 r8188eu
Content-Language: en-US
To: Dave Jiang <dave.jiang@intel.com>, Mahak Gupta <mahak_g@cs.iitr.ac.in>,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20220411205321.13109-1-mahak_g@cs.iitr.ac.in>
 <c5fc1685-b1cc-7cfa-1ddd-e2f93105c2a5@intel.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <c5fc1685-b1cc-7cfa-1ddd-e2f93105c2a5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/22 16:28, Dave Jiang wrote:
> Subject:
> 
> staging: r8188eu: fix multiple spelling errors in driver source
> 
> Given that it already annotated that it's the r8188eu driver, no need to add "in 
> driver r8188eu".
> 
> Maybe the log can be something less terse:
> 
> Fix multiple spelling errors reported by checkpatch.
> 
> 
> Probably doesn't hurt to fix other issues on the same line while you are at it. 
> See below...

Wrong on the first and last points. That subject is exactly what should be used 
- it describes what is being modified.

A given patch should fix one, and only one, problem.

Yes, the commit message could be less terse, but that is not a problem.

Larry
