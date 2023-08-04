Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F701805D
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 16:15:35 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6bcd51b8253so686118a34.3
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691165734; x=1691770534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1GBcOIPDeV7tNCVGIazG9k1O0TYrkQLn9asOqSiPhY=;
        b=pb6KmP/w2HARLiYWPpykQOTiAX37A/kdcv1HlxsEFJoMegJBPqjlp2lBhZDg+h7msu
         z3h2C7jj1eiK/09Vv434njdtKgAN8sUORIQTQ19eOftnkXt7Br4rJ5gnIZMG1j4BxKTN
         fANTrnNmC8wUI9aBj1WaqTf9W43XDLzqV8wRyHXAEdF51wbc2afY8zAKVEMxEcODs5Oo
         O+M7N8aYlJmXwQoBRxF156Jb8MOdLpTGwRmlQjaQPwQc3SC3rT3zXM+R+BqYjWp1RsGk
         stfEXy5I/Ho4u1FCz3YupavOR3CznsmJR7+TPbl0J186Fqxc73Ytq3aBcZGcgVVRuDq1
         EaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691165734; x=1691770534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1GBcOIPDeV7tNCVGIazG9k1O0TYrkQLn9asOqSiPhY=;
        b=caQHHnjqF5wces1I/jAmvaACPSaFOninFpWWxRDK7vidmVuQZ0W+KrLxOpH8nTBs38
         qaaALV0f2D3c/L13d4z6lw6OizzXWdYKlO2+QIDsx1ucVaOQEfH5chffyT0TwV9JcfAg
         f852J+9NglRXFcSvmn0fQp6HVWZx9kRnjKmQ2Iy+beBz6TTF6ggL5VWU5X6SqyCodV76
         B+3X09pafCESo01lF2fTw1UEfag3jcXXQF7peiwz7IdNe+f0MwjXIbN7QJX8gII9Wsxj
         h9ehzX1ABqhaozk5HSNinznANlsNe5wivOrqyVOtTrYPxU1zUGVIP+T1oemfPCQOVNmG
         Fg7Q==
X-Gm-Message-State: AOJu0Yx6PaYBwilowjdbcvWc66k19xoo47hne5XUxk16POSDMyOboaA7
	ylXgqcN0OJEL9/CT06ej+aA=
X-Google-Smtp-Source: AGHT+IFeD2MztaSvHXhBWgKsJN9DH+0mFgtYZ4uvvYNwKH2CJ9a4KXHoT0MqLhwAGEQZ0xIiYzKSWA==
X-Received: by 2002:a05:6870:ec9e:b0:196:45b7:9385 with SMTP id eo30-20020a056870ec9e00b0019645b79385mr2448663oab.27.1691165734387;
        Fri, 04 Aug 2023 09:15:34 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id dy53-20020a056870c7b500b001bb7cf75f09sm1257980oab.38.2023.08.04.09.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 09:15:34 -0700 (PDT)
Date: Fri, 4 Aug 2023 13:15:29 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <ZM0kIZfPbRnjAIJ9@alolivei-thinkpadt480s.gru.csb>
References: <ZM0QPaWv4lp93rGF@alolivei-thinkpadt480s.gru.csb>
 <a440a7c7-cfb8-478f-baca-af7e4d684ca8@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a440a7c7-cfb8-478f-baca-af7e4d684ca8@kadam.mountain>

On Fri, Aug 04, 2023 at 06:54:58PM +0300, Dan Carpenter wrote:
> On Fri, Aug 04, 2023 at 11:50:37AM -0300, Alexon Oliveira wrote:
> > Fixed warnings and checks as reported by checkpatch to adhere to the
> > Linux kernel coding-style guidelines.
> > 
> > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > ---
> > 
> > Changes in v4:
> > - Fixed changelog again
> > 
> > Changes in v3:
> > - Fixed changelog
> > 
> > Changes in v2:
> > - Fixed CHECK: line length exceeds 100 columns, noted by
> > Greg KH and Dan Carpenter
> > - Fixed CHECK: Alignment should match open parenthesis
> > - Fixed CHECK: Lines should not end with a '('
> 
> There you go.  You managed in the end.  :)
> 

Yay, at last :) Thank y'all for bearing with me. Next commits are going to be more fluid, promise.

> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> regards,
> dan carpenter
> 

Thank you.

Alexon Oliveira
