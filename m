Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947F1C8ED
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 16:04:28 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-64a5bc53646so34086676d6.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 09:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692806667; x=1693411467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AgwQQssNisFcDlSAbmB9tgKtABE8UDfzKEg3w2u2WUY=;
        b=PSHh0C0tup1HpJUcqAvhjxPp6TSWZfWCVDX4C6McSPiPkRG6fA1s4JVpwur/iUjjE5
         shFyXvjiCTQXOL8n1DADayXGQ/D+OUlX/1PGjxNYeVrDxt0IG6t4xvAicxy7c6UwhROr
         sGy5dHpBjLaCzkEY0vRuEPoE4brJUXa6CvcpxDm973Gsc1zuhjfGLjaYpM7M6qDV7Nmg
         v02UyYYx220ZOUdjSCVuD2DXmXrSTLFSZuBEmG6GfKt5Rm26KTqoD0iAXMPjU5Fasjvo
         2pKNlWBGMa4E6ozr31/ekMKNzYGzxoeTF1UHC6/QKLdO1kVGWM4J17MHVyrg86ON+TsV
         GGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692806667; x=1693411467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgwQQssNisFcDlSAbmB9tgKtABE8UDfzKEg3w2u2WUY=;
        b=Z26KCyRLZ1lmkWTY1yADC36Bbur9Sq1Q/0GkRm1ZD4tMUtTqVHOUJVUFOcG54hyWZ6
         KFl+LZBDLfNsXSBlNoi02jfOImCDvIyYvZSvF/KJ6TWuPx0BpyXysgw4ODyD9/zrf7SB
         WDcswy60IE2GWnXSCiUPdtRNHi0brX+Ca+FaZqWyZxzYlP+Bsy3O3Hqz1oskfSNsXxDd
         TwZHLZ/3N5H9eSJQLVHd7h3lqUwbBjDkHALKjHyDX+GyE1Y03TxmvyQgYjvlP4KLGo+I
         HT3vmUbLlQGl04ePgFvRfVxkfNnlLZZH9wxDe5BaWlRgpUgid8JsUEzLtrqPPySPS1TI
         1wCg==
X-Gm-Message-State: AOJu0YyxjWjozwpRF5fTUuPiVQpXXPuEisRe+zjfeCGajNWjw8/MsdCE
	ONJjZv2Ci+g1hQ4cQ6k4JHQ=
X-Google-Smtp-Source: AGHT+IHivHnj0yHlLVwLmnIv66NnFWZ14jcAHFP7qjk81m/CRqyiuMtdCNcSvg0MFWW1vMa5IEIAdQ==
X-Received: by 2002:a0c:e149:0:b0:64f:5ad7:f56a with SMTP id c9-20020a0ce149000000b0064f5ad7f56amr2555864qvl.9.1692806667162;
        Wed, 23 Aug 2023 09:04:27 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cca10000000b0064b502fdeecsm4133909qvk.68.2023.08.23.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:04:26 -0700 (PDT)
Date: Wed, 23 Aug 2023 13:04:22 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check unbalaced braces and
 misspellings
Message-ID: <ZOYuBvMS3pcpA37b@alolivei-thinkpadt480s.gru.csb>
References: <ZOVjfKUWsSAkbpZG@alolivei-thinkpadt480s.gru.csb>
 <2023082303-balmy-bucktooth-f85b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023082303-balmy-bucktooth-f85b@gregkh>

On Wed, Aug 23, 2023 at 08:49:25AM +0200, Greg KH wrote:
> On Tue, Aug 22, 2023 at 10:40:12PM -0300, Alexon Oliveira wrote:
> > Fixed all CHECK: Unbalanced braces around else statement,
> > CHECK: braces {} should be used on all arms of this statement,
> > and CHECK: 'specificed' may be misspelled - perhaps 'specified'?
> > as reported by checkpatch to adhere to the Linux kernel
> > coding-style guidelines.
> 
> That's two different things, so that means it should be two different
> patches.  Please send a patch series for this.
> 

ACK. I'm splitting them and resubmitting right now.

> thanks,
> 
> greg k-h

Thank you.

Alexon Oliveira
