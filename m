Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE61168
	for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 11:07:06 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id y8-20020a5e87080000b029050cfd126a26so14121264ioj.5
        for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 04:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=AvMyKnTkwsxUrtP3XQjHPh5T2O88RDnNqnIxyYnIxDM=;
        b=N6Ptnx7Ws6mqNzi7+POccTSu9G5u1TijtmNWJzPcgCMaBACoQGwZ03q/bE9VpbD2KY
         ifoLg97SOS8q1pn0T/4cIloqj1K2Zcu1GyZSHnTfP0u2FV1zPolcD8737xMi0nUsF1f8
         dq0G06teFmROHiC5+m9t/2wimV63GbJuJtJS6CZip6ijp+cwHIRfNtuuLLXNZiir6YWr
         jg3HaoIe3HhdtBT1ZFxKbtXWygelUs/PD7B/OS58SHnT/sEfC9kk57RnFn4uiL0KRKOa
         yzD3Tnkk2jagWtV9Z+BqArhJw05r0royF/QwgvQnSZKDjesywZHL4NR/nrIZ2XlTIYld
         rm3g==
X-Gm-Message-State: AOAM533zX6Y8XYYp/2j9w/nqipXk4V88IyIWkpoGB8v4JKsEz848eIYP
	Pm6hOnWszFv0IlkI+FgHA/amxqLUy+ckAgPfhcSyNtwPt427
X-Google-Smtp-Source: ABdhPJx/vetpoAeNKu+h2uUTRnfq90XIA1URsPj0f0m4j4mGg0p/BueIwuoYv8LVvOh5gGrqGwU9K0+iMrMbIOe/OTEglU2TUt1K
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:c0c3:: with SMTP id t3mr2483044ilf.80.1626174425449;
 Tue, 13 Jul 2021 04:07:05 -0700 (PDT)
Date: Tue, 13 Jul 2021 04:07:05 -0700
In-Reply-To: <20210713115546.34c99ea8@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f8c8e605c6ff3cff@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in r871xu_dev_remove
From: syzbot <syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	gregkh@linuxfoundation.org, hridayhegde1999@gmail.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	paskripkin@gmail.com, rkovhaev@gmail.com, straube.linux@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/staging/rtl8712/hal_init.c:46:3: error: implicit declaration of function 'shedule'; did you mean 'schedule'? [-Werror=implicit-function-declaration]


Tested on:

commit:         8f0df15b Add linux-next specific files for 20210713
git tree:       linux-next
dashboard link: https://syzkaller.appspot.com/bug?extid=5872a520e0ce0a7c7230
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13a2c06c300000

