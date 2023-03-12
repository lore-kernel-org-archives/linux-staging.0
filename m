Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3AB1FA3;
	Sun, 12 Mar 2023 10:39:21 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o5-20020a05600c510500b003ec0e4ec6deso2921323wms.3;
        Sun, 12 Mar 2023 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678617560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMdTgmpU8RaTXA//vhJdqgYfI33DbAxolT01iaaMnF8=;
        b=pCGswXdFmHJH+dr8+szeLEHwQNYX8ET2a3OHSS/G8oF/8qbP8mKwzsgnsxtBayCsjc
         BBZOIoyTvqp5gi/IypPEhxQ9OGZZtEa/K7cJuHQNI7PAPgW55TUWGXAlqjJOARvN+Z6z
         tt3A8VKAgHTTDynuN+3iA90bXpIeymj3WhXsm/+anVfXbAM7ygr8iMfcg87Syw/ctlRe
         08IhRSREHuYU9Qg25DKm4Jh0j9mkmrLa0jUbnHMtzEbwc/qpDDzUJcJe5YlvHHyzUKvh
         1otXzINKim+g1sGZwIK5jnZcgpj/KGNNAS/vGSs0CySNZoDUAJVS7jE8IW4FBe+YV20x
         HfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678617560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMdTgmpU8RaTXA//vhJdqgYfI33DbAxolT01iaaMnF8=;
        b=RyR4WOkPx66rYXKrlIvwy+fXnHK9Nt8PPnH68Jeb/G0K2N1FspwguXR27Je5KqN3d0
         GJlZTdg30ZGtVqckOup/SZu3rvZeDrtxrEYZ6TogtAnfPCCDbiD1UejdsrtrfxKGFoPS
         yMfy7XAmfmJmJTUzB6M6nq4OR0XmreqJf87t7exHtgViS+8ETEU+YRq1jzuu2G2sIyop
         MgIaXdypzdAgB/zSTrVV2VA+lAFsOuK6hpGhXsjCOB0aHvQ2ACVwg5i9q435Cp5xbN6O
         mJZmMh1qTmdqB5T/lnkB5VfvMRcydECP0joPLuWNw1hGT2TIozsKy9fE9liXYxQgvJGY
         9MPA==
X-Gm-Message-State: AO0yUKWuSq6jmxwtZFmQLSHDnf/+PQPmVK9SjYcjZb6fVyA8aacuyLwt
	vFU+WKpqkfn7Z0yAnKZW6Hg=
X-Google-Smtp-Source: AK7set9IoxJPNhRQ5r3XdnH3a/Nu6R/fpnkyVf5q9ZINBmzJZV10lkgST376i0Rd/NNGLPb0pFnBGw==
X-Received: by 2002:a05:600c:4e4f:b0:3eb:2de8:b74e with SMTP id e15-20020a05600c4e4f00b003eb2de8b74emr7751723wmq.27.1678617559501;
        Sun, 12 Mar 2023 03:39:19 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id h6-20020a1ccc06000000b003e22508a343sm5757893wmb.12.2023.03.12.03.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 03:39:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com, error27@gmail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, manishc@marvell.com, netdev@vger.kernel.org,
 outreachy@lists.linux.dev, julia.lawall@inria.fr
Subject: Re: [PATCH] Staging: qlge: Remove parenthesis around single condition
Date: Sun, 12 Mar 2023 11:39:17 +0100
Message-ID: <5367184.29KlJPOoH8@suse>
In-Reply-To: <20230312071700.GH14247@ubuntu>
References: <20230312071700.GH14247@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On domenica 12 marzo 2023 08:17:00 CET Sumitra Sharma wrote:
> Hi Fabio,
> 
> Thank you for the insights.

Hi Sumitra,

Please pay attention to the suggestions that Julia kindly provides to you.

A moment ago I read these other words from her to you: "Sorry to press the 
point, but you should be doing it now, not promising to do it in the future.".

She is sorry to press because of her special attitudes. I've been helped 
uncountable times by Julia who, despite her major role and commitments, is so 
kind to spend time here in a Sunday morning. 

I think that it's you who should be sorry for pushing her that way... 

You are doing it again and again: in your last message you did not provide the 
necessary context. You are asking me to recall which "insights" you are 
talking about. I know for sure that here there is someone who read hundreds of 
emails per day.

> I went to the .rst files because they are directly
> linked in the first-patch document. I also noticed the difference between a
> ".rst" file and its counter human readable ".html" file. You were right that
> many information is being missed when anyone will read the .rst instead of
> .html/.pdf.

Don't summarize my own words in order to make me understand what question you 
are answering. Just put my question/objection/comment inline while replying.

Most mentors here read several tens of emails per day. You should not expect 
them to skim the whole thread. Just reply inline, so they find all the 
necessary context in one place and so there is no need to traverse the thread 
to understand what you are referring to. 

You have been told so several times. You risk that someone starts to ignore 
your messages in order to save time for other applicants.

> I would like to suggest that the links that redirect to the .rst
> source files in the first-patch document must be changed to the links that
> redirect to there corresponding human readable format. Let me know if I 
could
> do it under the [KERNEL NEWBIEs ACCESS].

This is a great idea and I fully agree with you.
Please ask Alison to grant access to change that documentation (it's not 
something I can do myself).

> Apart from this I will be happy to patch the style guide after this
> contribution period.

Best applicants go on with further contributions after the end of these 
period. This fact has been observed several times in the other rounds.
I'd like to see more people who are seriously willing to be part of this 
Community, regardless of the Outreachy project's deadlines. 

> Regards,
> 
> Sumitra

Thanks,

Fabio

P.S.: I probably went a bit too far in the first part of this email. I am 
sorry about it. However, please demonstrate that you finally got it, not with 
further promises but with actual changes in the way you communicate :-)



