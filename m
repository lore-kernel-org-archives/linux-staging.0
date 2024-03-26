Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910D54904
	for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711446325; cv=none; b=FbjOyc1pKNqf/QRXyhWGaA+nqS7k8UzmiTOwqWjfxZbBfH+KvSsNYi/ip3ISJYCoTKVi850O73Y4ktBnU7WOSBBM3CusOMyor4/nHfEOsOLxaNPES+vFa6E4/XoFOzm8nlIivuT3+dnYIMOcIfiEtXDP5xRCB5ou5ID95X0ehPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711446325; c=relaxed/simple;
	bh=z4ckFLSKgHuxiKdRH/iBzAtjH89ipqq/gw0Z/JxSiPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxKnY40Z3IWvg3k0b0HHqCrm7BQgjg4I6rCyQZcJTDssSfTujmMFRLJfEMzyoeCmfUqGU58Y2YUYnuHietEE0bZuoebEauvssVF4Nr0tu6JCFMdeAUQDTdaopcDmnBA+p89xhiMPRhI45TGbppkLiQ57+2un8tjHvo366BRW7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IvMwog65; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IvMwog65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711446322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qq87EKo5doMdIAJhz4L/YqYBJNyyuGhOr7CHSKohSNw=;
	b=IvMwog65orhtCis1H4zQhsFN5J2f5PY1xpqQRW+v84eFM5Gmes7FxkeYsnDjBYoFiFJo2l
	O/+YKVJdutLjodP+q5bjDnRUcjF4Vi4eURyYC2x8MvpQYzZhK9u0qRzFSl/5uid9t4Wj9J
	UZfdbrZUdeuy+V8dF8jgpq8q70C0n0o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-gQB6cvsoMWmHKr5yI1012A-1; Tue, 26 Mar 2024 05:45:19 -0400
X-MC-Unique: gQB6cvsoMWmHKr5yI1012A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33ece03ca5dso3767808f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 02:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711446317; x=1712051117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq87EKo5doMdIAJhz4L/YqYBJNyyuGhOr7CHSKohSNw=;
        b=BmBOifu/U1CWwLjMUDijU0fCOcSgIxkW30skYhkavunKnlwIOxL+TkIp95k9rFOvoW
         4cSpduAFn5oxsSHqV28cKMTA07Els5bKk16jE1J5/GuepVXuAU6luCjFTdk2TOMifCH/
         GnV8CHwgBQSFdoWkF1Io3zwi7QnYpKhfHtpY0BeLlXXiCb1S2a3OEukfAloejFbuRBf4
         6Y7+VUvy1eh7w8VEp0D9EnTn6FRikCgl/glKFpEd2ZjubK4XpQMCDVZSRN9wzarF/sQI
         iNakh/miDeFN5e4Tmn3vQKQpTachfD9qmMHTo/wL8bZicWmCfnS40eneWO5lNZ9R/wW3
         S4jA==
X-Forwarded-Encrypted: i=1; AJvYcCWpn2L+mqx89ZvGGokjES3UoZg0pcKGPYEHZNnZf77VoM7vCVsN8I5WZyHHW7OJHax6n7aZkyFyVYfwclks2fR5Bk+Xgpcc1JLlDuUmcA==
X-Gm-Message-State: AOJu0YwfhQaqSAVprAsjNyov9k2Dd4hTSFfowFm/cvIQT8wiNrn86j2Z
	HPFfNr6alj4WgYi3HHbBLhnfRSMHE+Qa2wAkheIwumAWXR5kTwCK6mqXb4oeoWFWpTI3rss9NxW
	ly/njgpJfZ3jYo178Xirleeupzw7c/cvD0szMQZr0G1cl1KmvAd8Yl6hR8QnGI8aIjiqzGUMUoe
	GsObY3gnmP1sD+VSX4rO8D3LbRyIPdpeZsVuwJdg==
X-Received: by 2002:adf:ab02:0:b0:33e:75d9:75cf with SMTP id q2-20020adfab02000000b0033e75d975cfmr7130466wrc.52.1711446316821;
        Tue, 26 Mar 2024 02:45:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlOeqpFdXnke46IIvxEjeKEnRMA7LEtLxf8Oj+mS8jdQubOxUOBaujS4vDD8AwYp/MeYY3fjc/7FnbAlYZ+Ek=
X-Received: by 2002:adf:ab02:0:b0:33e:75d9:75cf with SMTP id
 q2-20020adfab02000000b0033e75d975cfmr7130443wrc.52.1711446316425; Tue, 26 Mar
 2024 02:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313114126.1418453-1-ppandit@redhat.com> <2024032540-scrubbed-reluctant-8860@gregkh>
 <201b6c82-1ebf-4dc2-9221-4fc87d1dd565@moroto.mountain>
In-Reply-To: <201b6c82-1ebf-4dc2-9221-4fc87d1dd565@moroto.mountain>
From: Prasad Pandit <ppandit@redhat.com>
Date: Tue, 26 Mar 2024 15:15:00 +0530
Message-ID: <CAE8KmOxG=3sWKpeB5fdWTK-SCipS=JyDE-_DNgY--DtoSQZ0Qw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: bcm2835-audio: add terminating new line to Kconfig
To: Dan Carpenter <dan.carpenter@linaro.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-arm-kernel@lists.infradead.org, rjui@broadcom.com, 
	sbranden@broadcom.com, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Prasad Pandit <pjp@fedoraproject.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello Greg, Dan

On Tue, 26 Mar 2024 at 01:12, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> On Mon, Mar 25, 2024 at 07:04:15PM +0100, Greg KH wrote:
>>  If it's an out-of-tree parser, that's different, and the tool should be fixed, no
>> need to touch the kernel files for no good reason.
> It's annoying to cat a file when it doesn't have a newline on the end...
>
> dcarpenter@moroto:~/progs/kernel/trees$ cat -n drivers/staging/vc04_services/bcm2835-audio/Kconfig
>     11            running on VideoCore.dcarpenter@moroto:~/progs/kernel/trees$
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> So you could resend with that as a justification.  But, yeah, it's a
> good idea to fix the tool as well.

* I'm trying to fix errors reported by the config-kernel[1] tool. It
is an out-of-tree parser.

* IMHO, this patch should be evaluated on whether not having the
terminating new-line character is right or wrong? Saying that patch is
not required because we don't know if it breaks an in-tree parser OR
that patch is acceptable for the annoyance while using cat(1) command
does not seem right.

* As for fixing the parser, I did try to do that in the past but did
not find a good fix for it, I'll try again. Meanwhile, I tried to find
out how many such files are there?
===
$ tf=0 df=0; for f in $(find . -path "./[a-zA-Z0-9]*" -name Kconfig*);
do tf=$(($tf+1)); eof=$(tail -c1 $f); if [ -n "$eof" -a "$eof" != "\n"
]; then echo $f; df=$(($df+1)); fi done 2> /dev/null; echo
"No-NL-Files/Total-Files: $df/$tf";
./drivers/staging/vc04_services/bcm2835-audio/Kconfig
./drivers/media/dvb-frontends/cxd2880/Kconfig
No-NL-Files/Total-Files: 2/1698

$ tf=0 df=0; for f in $(find . -path "./[a-zA-Z0-9]*" -type f); do
tf=$(($tf+1)); eof=$(tail -c1 $f); if [ -n "$eof" -a "$eof" != "\n" ];
then echo $f; df=$(($df+1)); fi done 2> /dev/null; echo
"No-NL-Files/Total-Files: $df/$tf";
./drivers/gpu/drm/i915/gt/shaders/README
./drivers/gpu/drm/xe/display/xe_fb_pin.c
./drivers/gpu/drm/sprd/Makefile
...
No-NL-Files/Total-Files: 65/84319
===

* There are 2 Kconfig files which don't terminate with a new-line
character. I have sent fix patches for both of them. Rest of all
~99.90+% regular files follow the norm of terminating with a new-line
character. Clearly files not terminating with a new-line are erroneous
and should be fixed. Suggesting to fix the parsers to handle erroneous
input files, which can be easily fixed in the source tree itself, is
not reasonable. Maybe as Dan suggested, it'll help to add a check to
'checkpatch.pl' script to flag patches which try to add files without
terminating new-lines. I tried to look into checkpatch.pl script, but
it's quite big to understand in a day or two.

* I'm okay to resend the patch saying annoyance while using cat(1)
command as justification if that works. If in-tree parser is the only
criteria, what would be the process to make config-kernel[1] tool an
in-tree parser? I can try to follow that process.

Thank you.
---
  - Prasad
[1] https://github.com/pjps/config-kernel

