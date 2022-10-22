Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92568257B;
	Sat, 22 Oct 2022 08:11:46 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id x13so1888629qvn.6;
        Sat, 22 Oct 2022 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rggtGs9F9HdIZ3XJoyK0KkYkbfdufgIdmWrXX7fIUbY=;
        b=cap0fKjNvHJLxCMt/fs4tSu8jPh4Zp0w9cHAVfH9L6FQ86U1d3GlalbTg279FH/+yK
         wY//tOG8eOESxqqTe6HV8VSU6l1GNu5+KNUGYzfOHME+GHvrFHsB7IbtpyHtkwXXeb9c
         eqdqlRYjlxE2eQ977z8xu8M5vQQPWKvynM9WpgXsUNCK51h4clnlC8DvHkQQJhurzOPa
         2HXyKw8YMCLDIS/7YuaYjiLt1C+d+6u2xZ1SAEFLCRYWHvQWIpV3iBdB95A0aID1LP9X
         QnOsB4aDa4AWSZHszzxyom4R3RHGAUMwKP6KGcqyEpSteiTvN/I+wyziUN2KrMcKlplf
         +C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rggtGs9F9HdIZ3XJoyK0KkYkbfdufgIdmWrXX7fIUbY=;
        b=Va48rLGgaZlhZXtZHGg8B6BvHLY7/W1LCrXXu9r+hXeATR3qjTxM3YZvLd8r/Kr521
         CDtd36LS2VqqZQDjAx98xay0H7GFIBx884jZNkGlg8sp5fY06za9xJnfJR6kvDGFZfS5
         zYeIoeXtzc2A+MgN/9T8CIlyV/QNxDQnIRhzngcKQqfVHTwycND+mau0dshzeqcyqyTC
         LlPnMLT5cJ58Nrv6oFnp2LxAMI9J/4BGzTP6bIjWdghKTjHmiEEvBsCl+E+UGfGWf9E/
         GGKXSuA9UPNYQ9TSXcpmBqWNWE5PYPNlKmDFy0AWSpbY+JZiiT4QBE8w6GX56fgITEle
         gX3w==
X-Gm-Message-State: ACrzQf07cErcxqgjqZ1QCERvTuzfZNS7VdvSY5+EI0j9dUmGs1PVDHY4
	P3x0/8ZfMq/iMEtQhXqDf9xz27sxqVQYc4vLeNvm3DeLdpDsHv2hbBM=
X-Google-Smtp-Source: AMsMyM4Go+5Kt+TUkyRlqj608ncsA/C6yBkRGUPNX8mBpP+a5pyakdLGlyl6X5q6zpmCF7utoQBQYxZ4/MM/4RhwHtU=
X-Received: by 2002:ad4:5d6c:0:b0:4af:b5e0:63f1 with SMTP id
 fn12-20020ad45d6c000000b004afb5e063f1mr19499506qvb.35.1666426305215; Sat, 22
 Oct 2022 01:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 09:11:33 +0100
Message-ID: <CAHJEyKVi=Bw1=-cH8dbJratKw3Lk3ubh_9bcBB=iKPm5H7P1Yw@mail.gmail.com>
Subject: request for assistance
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

There is a portion of the Outreachy first patch wiki I would like to
edit. How do I go about doing this?
- Should I just go on and edit it? or
- Do I have to make a proposition addressed to someone or somewhere,
stating what it is I want to change and why?
I would appreciate your help.
thanks

Tanju
