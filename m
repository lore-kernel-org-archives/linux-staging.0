Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976E7C
	for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 07:45:13 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id j8so23075831ejx.9
        for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=BITzr7eaqZDWN9J3zA+mBc+Jo1kRZ2EMV6/Z9lL2EMQ=;
        b=bNlWuLBs8GCE+7ka7N/s08dLf07u3ZpgF6mQfe5nOAgCOzRYF1JRf9t54QNz2jqsqn
         KwuyRypgQVtxQTG/gnPjXua7x5Zmtj4DkrRHPB+W3Ruouj8crgEyFAWKU/UFYHZrevqA
         Tu9pda1MWmQ/eDmBcbEHzDgTJNQp0c84vsVXvHmJ6Y9t+YFnFN+lAr13Urjn2JWDf8Gy
         s8Xx4rsCIkByg5O+cw/L4opxTjI1b2Rktbx4jPzNk2P1vCEjlTQbZNJOtJY1WeBlLvRE
         dzzFGq8BsrEKf+tTrAezQTWoo9LEHzXzTc0YMcKI8FmV00ECzItPEy22A3C/idOhp5o3
         2oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=BITzr7eaqZDWN9J3zA+mBc+Jo1kRZ2EMV6/Z9lL2EMQ=;
        b=BckRAR7EvTJhZE+/csKQHhYLSed6UCWC7HcPWgv1v0GsejLUFrDmGEdDptleGfkqK2
         59NuQ6zvgccZ5jeDyXvHVLT3sKoPSHpRoMux1NQfkwUre0XxKGX774YsS91uE0Fvewex
         CP3vZvKkmx0DgQOr7Mi/wwXTyzJkgppDjMgc0tNTcTq9H3p5WaL2jrpgVc0WQYiZsS6e
         WODsXA+9bikG1Mxu3bJsk3V07QHqFiiBTBKzvaAd3pbPFtC2DBM7J1cD80sfM2IYn0l9
         acuo9krdFkMQv5hnOWnvN+OM/kGf2Gj6MX7T9eBcgA6EQNoI5oWQ+uJJTjl81cluKbY+
         9sag==
X-Gm-Message-State: ACgBeo27U3X4bj10mL7sQCUqHsFjGNCBlaa2GxD76HtfqQFXAg6FSGhx
	uMYsIlrHR71UJxmtd6JR5bQ=
X-Google-Smtp-Source: AA6agR6E+6b2jXdoxvTMntgNL9Lk462Bgvhl6B0xPBHN/SLGgjJO8H2pdr8kZsJxlsyjUGCcZGDeig==
X-Received: by 2002:a17:907:b590:b0:730:9e03:95a8 with SMTP id qx16-20020a170907b59000b007309e0395a8mr15776875ejc.384.1660722311547;
        Wed, 17 Aug 2022 00:45:11 -0700 (PDT)
Received: from agape.jhs ([5.171.72.69])
        by smtp.gmail.com with ESMTPSA id o10-20020a056402038a00b0043a7134b381sm10052533edv.11.2022.08.17.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:45:10 -0700 (PDT)
Date: Wed, 17 Aug 2022 09:45:07 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Simone Serra <serrazimone@gmail.com>
Cc: gregkh@linuxfoundation.org, soumya.negi97@gmail.com,
	hdegoede@redhat.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixes compilation errors after checkpatch warnings
Message-ID: <YvycgyjCwKlsp318@agape.jhs>
References: <20220809143743.742636-1-serrazimone@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809143743.742636-1-serrazimone@gmail.com>

Hello Simone,

On Tue, Aug 09, 2022 at 04:37:43PM +0200, Simone Serra wrote:
> This patch fixes compilation errors produced by the previous commit that resolved a number of checkpatch warnings and errors
> 

thanks for your patches. Try to focus on a single checkpatch error
and send a patchset for that one. This makes review easier.

It is a good thing for a patch to fix one thing and to have a proper
commit message describing what the patch is meant to fix. Don't be too
generic.

Always compile test your patches, before submitting!

Thank you,

fabio
