Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7415C3FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:52:06 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id cq23so25486923edb.12
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3cvXcL1EbI/iDDtCobjLWg42RRxXiQlq4y90VtEpZj0=;
        b=TzPtTUwe3SnLYU8MzGeVWn1T8weR0AQfU//PBvCuTJ+RbMxHAhIFdpCHGFwmcZJoOx
         dVu9kNSpU627RwyB7Ifia3CEA8q4lpGgfvDEwjyv18IwMhaZrA4jmYSqlOt8YENf3W2Z
         zvnU82RXYzu2Jm/QO4Fk+XDvcPBVv69wgkj4JmyIGS733ZxWN6y3fFjxpjRUD8S6JYPf
         ADULq2J0SWfR0GXLz3XmnIAG+nn/JMKulpQ8DKLzT4NQCKml2kncvAthjSeSx/8kzXxI
         Lu6oLS+FicrddgZOa53phezM424jXGkPwiDWAC9S0XcQ9VfkaDFMkvBiT++vkY5JSD2L
         qzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3cvXcL1EbI/iDDtCobjLWg42RRxXiQlq4y90VtEpZj0=;
        b=Y37f794NKT/nAIlJFfFk1FFqPGIkg1xArueP/WhbryEIuwjVjPbNXhJkK0B/t89Ziv
         p8rMzgpAWYtV+JkLGb8FhV0ChNOGeUtKwORUUyNVWxA5kkmz9o2Vi9bQySGPs5cUuhaw
         l7N8Wxqm204VTEFUL5hBh+8E3ryOxCWJJO+saC4FmpkVQ2zDxRtFE51A+2/X6FIemb1c
         ohn/kxLapJha/iJYAR7gSesmtXoeQZwD/cIbs96AaprN6M6SrxzDUq/t5kVVxIorrNGy
         LMqs/e8lK9o/6j6gPPaukBV8JwKDtFejDZLf4RNARuvm+VPsfafw6l0ZkEo3yNPj3NnB
         g9Eg==
X-Gm-Message-State: AOAM5335jM/LMNj6e7k7IAJzGX4gfnhTmscgqrDxJqOf5qBtbDFhyJ/M
	HhzbBrwvyCk0zcf7KPhG1Wsx5aUnZug=
X-Google-Smtp-Source: ABdhPJyaYdMFnXAO05iG0gijpnw7nLNMhhj9w03gchjtWiTBYzmZ0Th/ro6njLdDV8qmKkn7YpWn7Q==
X-Received: by 2002:a05:6402:1747:: with SMTP id v7mr37887089edx.19.1629715924880;
        Mon, 23 Aug 2021 03:52:04 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id ck17sm9015616edb.88.2021.08.23.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 03:52:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH RFC] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Mon, 23 Aug 2021 12:52:03 +0200
Message-ID: <9262363.nlPuahNmOB@localhost.localdomain>
In-Reply-To: <8d37d8e5-7ba5-d49b-f2c5-f7e8844ae8e1@gmail.com>
References: <20210822230235.10953-1-fmdefrancesco@gmail.com> <69bbb80c-2b30-28b9-ad8c-6862a6c3b911@gmail.com> <8d37d8e5-7ba5-d49b-f2c5-f7e8844ae8e1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, August 23, 2021 10:30:53 AM CEST Pavel Skripkin wrote:
> On 8/23/21 11:11 AM, Pavel Skripkin wrote:
> > On 8/23/21 2:02 AM, Fabio M. De Francesco wrote:
> >> Replace usb_control_msg() with the new usb_control_msg_recv() and
> >> usb_control_msg_send() API of USB Core.
> >> [...]
> >>
> >> @@ -47,19 +47,20 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
> >>   		memset(pIo_buf, 0, len);
> >>   
> 		^^^^^^^^^^^^^^^^^^^^^^^
> 
> And this memset becomes useless, since usb_control_msg_recv cannot 
> receive only part of the message
> 
I didn't notice it at all. Obviously, I'll remove it.

Thanks,

Fabio
> 
> With regards,
> Pavel Skripkin
> 




