Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73A42C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 19:33:00 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id w19so52228060edd.2
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 12:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C1QhJFF4/w/wmkrgS9B8Sp+Sdrku9F5YiHYF/12cvTY=;
        b=IgDgGVKdhkvN4VTD26TrFOLexbn6XnMoQKVh77MR8TSY/1ybT3cAdzqRTCGdVttjbF
         h8luy+JDU9l+V+OAZ+JxathCO9wdnzUYWrFp4HDbpVRFHbo4jZ/Q46bCQgynWsabX92d
         +pNio31IpkviO/zQSYkPBGwYfPXQ12fkx0Dro5iV+/TatfcdCwR7s6gUQrvLsL+CjHCd
         t/vwIvyx88BeVsdOv8d2f8JBbVwB7OU1vCVAY0dDQr0Spltr9NO1iBPCHh1jykgQ43fa
         q58B04HE1ImhyHt0L9S+P3NXh0dvqPGENEXEx6WAa+mY8KrMXktturzl9epNstiX/9C5
         URWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C1QhJFF4/w/wmkrgS9B8Sp+Sdrku9F5YiHYF/12cvTY=;
        b=vfqjRKWh3O+d11/CXT15a41QIFOU4pxnybzLUmdV7gjNZhnK1A0LGiKW1IyevWa4r/
         z4KRNneO4KiyMawOutWuIiBvoFbBAOOAD/TY7aoHv/DhPgRtwShQZmZFD9tcHMqS3lbW
         n/wH+cfB29GS43eNBCbQEU1Lqk2hU+T0/I4xUy+wn25ggGLjjPqBZOHKwN2sNcVB3umZ
         b49OcHy2SRdkWV2LWsbDAywgmGKUnDi7oYk7Oum/665gBh6wwXQOXqjEXqUUyfgLfS4L
         6Wt1FTD9uIedhfth9F3IYTlJGfln3LPjy124/jUqZCH0Cw2JG0w3PdksqNozUQagr/9g
         X/pA==
X-Gm-Message-State: AOAM531kO6pQkWcL1GHARN1jCwFC0s6OQC/ob8+1fIP3lx6R8X5DltHB
	zPcYr5sEj8dghTOGP3sSJSs=
X-Google-Smtp-Source: ABdhPJwcHrIuckPpvXKirx3kK/CVANsiUIp5el7Uj4OfuLJ1NYJGmHbnWXAUQXGeSC9CxVA6PIJuFg==
X-Received: by 2002:a17:906:52d6:: with SMTP id w22mr16981632ejn.248.1634412778990;
        Sat, 16 Oct 2021 12:32:58 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id g2sm7363674edq.81.2021.10.16.12.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 12:32:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: r8188eu: Use completions for signaling start and end kthread
Date: Sat, 16 Oct 2021 21:32:57 +0200
Message-ID: <3725568.Q3VL8gKjhB@localhost.localdomain>
In-Reply-To: <20211016192604.GV8429@kadam>
References: <20211016091042.19614-1-fmdefrancesco@gmail.com> <20211016091042.19614-2-fmdefrancesco@gmail.com> <20211016192604.GV8429@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 16, 2021 9:26:04 PM CEST Dan Carpenter wrote:
> Yeah, you're right.  This is fine.  It's a bit confusing how Arnd
> re-used complete to start the function.
> 
> regards,
> dan carpenter
> 

Thanks, Dan.

What still confuses me is why rtw_start_drv_threads() wants to be notified 
that the kthread has started. Can you please answer this question?

Regards,

Fabio



