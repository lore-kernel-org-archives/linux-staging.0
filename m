Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12529CA
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 08:08:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M8yU2-1m9Uvx1U2g-0068wa for <linux-staging@lists.linux.dev>; Tue, 10 Aug
 2021 10:08:47 +0200
Received: by mail-wm1-f53.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so1298954wms.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 01:08:47 -0700 (PDT)
X-Gm-Message-State: AOAM530GwgjEvU875z0kHbK4U6pK3Lmjx1kIKWbKHAwf9q7rXsy4yNcT
	Xt0rySWMPqdXb3SNx9lJduiCWeqy6ofw5F1JSAs=
X-Google-Smtp-Source: ABdhPJxkzP4Q2zQTEo3s9UPxx301gGDi4/OLRtRPtP7wUJ3xntwom9/Bot4PT6DXh3WIsPvwtIFBWvBhemZBAenjobc=
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr3253750wmm.120.1628582926964;
 Tue, 10 Aug 2021 01:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210810074504.957-1-phil@philpotter.co.uk>
In-Reply-To: <20210810074504.957-1-phil@philpotter.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Aug 2021 10:08:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2n6WfsQUKP7W4VytJ6K=CGcfOz-eSc=6FzvkANWkk87A@mail.gmail.com>
Message-ID: <CAK8P3a2n6WfsQUKP7W4VytJ6K=CGcfOz-eSc=6FzvkANWkk87A@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove rtw_ioctl function
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2NiR/a61EGvCTfrjAhC/XfLATpPeM+MAULSgULRddOUbi5x0y5B
 bREluD5HIsXCa73yeycDct22O6VhYufYgsQeMX4bgCdi0fclKJgNBjUR0gHGO8284mMaorn
 Ic3VAUrUyNIaEANg2coAxEZ9gO4epcw+RlUifePgXiiQAmllyQNga8o+uu1OzCZWl3cfKMN
 mAx5B4bjf8Mri+vylZgcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:213KF5o/8eM=:PzqnVKlbvWZ90U4XYjm090
 e1fDir1XhFFHIEWcLxMqzzZo+j8usJWb+z683hqgdRFnJTrcRdAUM4U0wKjUgv1P/M4S5Ff8R
 xY4ZAZlBQDb3vE//S8BXoVKLxjIN0F3Ip6wzj1I07WnIOizPNOln2zTQVgT0TRuO40xdOhl8y
 iIN4lh2gi0LwwWWqRw58Vn/VKkwJATueEc3l2XHKgyzDAE+3VntGE74+lCvbgLP9CHkWXQQbQ
 c4rr6ob7K4ekuT8vI+SXWPml53+8R6UBDWccv/Me8IcyY6QdEvvVAQ/bFq+KEKKsqipjmqYOX
 rRCDZ1P+gW2ANVzp27wwHDYqCMlK6dx8z/Xf9kmQY0ECC4rt/WhElhdueep+WFdhoQc50FzRF
 lnXXWj+nPr6r1yDKSUB6uGI9T1RFHNPQZQO6obUQ7v336nrz3TgoxzdS1boynIto+d5HNcHYp
 Dyki7e0cm3NmxynXrNpW4zNVO+Xk44y8SCN9fE3mE97dk0P3eF8Va3tkWAgyyfAUDlBsHN+Bm
 uukJYwmbOLet+Rlm/M7YpZ/VxWggHlxL16V66z2KdN92vZlFBqdADIAeCrGIfMsLR+7mfocrp
 vGeYn9KT66cbBUMg1IMS3llmm0qz3aSCPHM27aY276WGe5Y97nF0crvz4Qde65Dh7hKKMnmXP
 3AmbXvmI3sJiLwtFZBin9iUebVCyOsJXEkdPmPVYVZZNLgBm8nUOmPEKWPBND0uqe86EXuCGM
 Gu0YlS4sDuHEGD5Yd9ZkLRIW50cIotLoo8hlOmfVaTkGS04hUjbroedWEmo0niOPnwU+yy1Iu
 TVVpU3kYOPS6yNG7ehb3EYg5g+H2FSLhK0JMvEFJ5x9rsENIghO6JDKftDp9Nu4uQJVtWGnj5
 WIViAopOK8eHcVg8gDsx53WSJfitb+g6xSLa9EMsKwoZyPzs9ivBOCo+JKADJefCY3Xntf/Mj
 q+2x6AWw+KGlFO3oTrlk6RLtlIiudQuv8zw2IoHL7HGQrzNyW6QUW

On Tue, Aug 10, 2021 at 9:45 AM Phillip Potter <phil@philpotter.co.uk> wrote:
> -int rtw_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
> -{
> -       struct iwreq *wrq = (struct iwreq *)rq;
> -       int ret = 0;
> -
> -       switch (cmd) {
> -       case RTL_IOCTL_WPA_SUPPLICANT:
> -               ret = wpa_supplicant_ioctl(dev, &wrq->u.data);
> -               break;
> -#ifdef CONFIG_88EU_AP_MODE
> -       case RTL_IOCTL_HOSTAPD:
> -               ret = rtw_hostapd_ioctl(dev, &wrq->u.data);
> -               break;
> -#endif /*  CONFIG_88EU_AP_MODE */
> -       case SIOCDEVPRIVATE:
> -               ret = rtw_ioctl_wext_private(dev, &wrq->u);
> -               break;


I think these functions are all defined 'static' in the same file, so
removing the
caller will cause a warning about an unused function. Better remove the
called functions along with the caller.

       Arnd
