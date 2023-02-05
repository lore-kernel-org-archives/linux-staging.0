Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CFF107B8
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 18:21:18 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id me3so28396461ejb.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i63w/pV88DLO03mXliw8xYbIqTY9OqCF6qi2JifxJgg=;
        b=UjBHK6w6zZRkUaf8Bv6/PD0Vnx7BBG2ON4xhzbvdzpD8iRGNOI50WVi4jEANcWQmqP
         xozQq3qXk0Hr46jh9fiG1+g+u4CkfsoyUmM2gHWVr5we9KptIByDd0yj2OIK1bT+juuo
         qpfGG4rOUwkJFVryU5cDCo+Jje/+EgBFo9sdG0uWt4sSbllrv330LM0/S4C8H7S7sdS6
         YMB46GJwMOYJ4eyNu08K7NlskuvwfyDzjEtLE3rBpGhXxU59MIHL9Om6CeJf1PfFetqC
         F29jf0KrNFh2h+lP5rr4QkvS/NQ2mbIAJEmwbWfEYUT12/se++/QJPJV7MQwowzRS6JV
         cH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i63w/pV88DLO03mXliw8xYbIqTY9OqCF6qi2JifxJgg=;
        b=vZfX5LCYYUE7ElT4YU0VxFplfQLyKK6T5emePOOYhvh4FY6nXBfwgfFBHpMo91pA5/
         Bd3sYS70f/pYQmSwSnVPVXcebbe16oaG1FJCCJIsUsqq6+axKT+4/vNUfKRQ2sNnP2VM
         iAcnIh0tsUThWWCe5AK4o0o6E+9KqiuMdtAvzawHZUYcRPXgswV65L6Ct9cz44sfv/I1
         YxctBqQC6o/hxgr2d419Ds/OaOYxhpmR77stMd3dcl73mSmgsAmmS/y5IRJpyflSjXfR
         PRwOiUirYPhf9Jq5x4hPXVXtaYoAhQNM0iDA//wTtvVHjUyHNkSvOqosJVm/Gb9a5jl9
         iLAA==
X-Gm-Message-State: AO0yUKUde0gQD+0gEG9b2uxtPTrEgpDoyR+nSI5woP3rupAeJAM/abp3
	Gk57cYMGl0RWgD9mhr5dbus=
X-Google-Smtp-Source: AK7set+CALiS3x2OAR+iXb85KCT92QwReNI/aP9r1T5bggcmlXY8f6S4gscfACoO5PG1orCsM6MoZg==
X-Received: by 2002:a17:906:ae4f:b0:877:962f:be0a with SMTP id lf15-20020a170906ae4f00b00877962fbe0amr15272422ejb.37.1675621277114;
        Sun, 05 Feb 2023 10:21:17 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170906b04b00b0088e9bbae7ecsm4335843ejb.165.2023.02.05.10.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 10:21:16 -0800 (PST)
Date: Sun, 5 Feb 2023 19:21:14 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Nam Cao <namcaov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y9/zml6iPvoBBVXx@combine-ThinkPad-S1-Yoga>
References: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>
 <Y9+sFw0rviTAJNMf@kroah.com>
 <Y9+vkwYfQzYTbIIo@combine-ThinkPad-S1-Yoga>
 <Y9/MhS3pJ/Es0sGa@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9/MhS3pJ/Es0sGa@nam-dell>

On Sun, Feb 05, 2023 at 04:34:29PM +0100, Nam Cao wrote:
> On Sun, Feb 05, 2023 at 02:30:59PM +0100, Guru Mehar Rachaputi wrote:
> > On Sun, Feb 05, 2023 at 02:16:07PM +0100, Greg Kroah-Hartman wrote:
> > > On Sun, Feb 05, 2023 at 02:08:02PM +0100, Guru Mehar Rachaputi wrote:
> > > > This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> > > > as '(iobase)' to avoid precedence issues"
> > > > 
> > > > ---
> > > > Changes in v3:
> > > > 	- Whitespace error from checkpatch fixed
> > > > 
> > > > Changes in v2:
> > > > 	- Macros with one statement that is to call 'iowrite8' function changed
> > > > 	to inline function as reviewed by gregkh@linuxfoundation.org.
> > > > 	In relation to this, names of the callers of macro are also modified
> > > > 	to call this function.
> > > > 
> > > > Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> > > 
> > > Try to take this patch and apply it to a tree, and see that everything
> > > below the --- line is thrown away, including your signed-off-by: line :(
> > > 
> > Sorry, should not a patch contain signed-off-by: line?
> > I did not understand.
> 
> Patches must include signed-off-by. However your patch has it below the
> --- line, and git will throw it away. You can try "git am <your patch>"
> and see for yourself.
> 
> Best regards,
> Nam
I made my current working branch track origin/staging-testing and
modified the commit message and sent the patch again. I hope there won't
be any issue.

-- 
Thanks & Regards,
Guru
