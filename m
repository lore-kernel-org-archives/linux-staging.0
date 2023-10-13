Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C892C874
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 23:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-57b6d19955bso3747220eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 16:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697241031; x=1697845831;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVucjE2yjEUScH3CxBlb1yDLAQs8UXrP8jjUHECcl9E=;
        b=hPv/C2hmwOUbQ73nZFgDhGTt4m4PskiPTvSV4rAiGtt8hAOOrDErT6pvBo1H/d7KZn
         DgNyc909K5f/m78ItW0UZgOeeydyHdmrfWhxFcJ7bwi7pGs8ngo0dAk8VvK5ECt6Bp6N
         dA0R61PsvCE9Nw+mkt4osvtMSTU+CLbyYEyK2iaqFtZrXXeDfBp3oRVAwHk+IxwdLMqJ
         e1Y1piGQ4ifeb/7kGuP2By+MepzURyWWZl7s5geNkBdaJYwpcFYAibKr4VMAahTaW73R
         6W41FQoMyUKkfjhcy9vVPEJWiA834BhwWwK8L90aAChFllWLLC+7L2kMZ4jo5NLtf6Be
         BnXQ==
X-Gm-Message-State: AOJu0YwLPXWeGex27ijJcMSstUEeKqyz6EgelawJW8xn5nKH5y0SLU7r
	mIbNmTTRs7MBdy+1Ra5EJqD0vlqnN5gGu6hKy8SmRCWex37G
X-Google-Smtp-Source: AGHT+IE3mNXgUnbffBl6NSf5U/f6BkF5zcp3zWCtahDMEOqUgDVEwA664Ic/SJhZmaojLteaqQnARfehrtWV0EEV2R2SYULgmyRN
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:9881:b0:1dc:e729:66f7 with SMTP id
 eg1-20020a056870988100b001dce72966f7mr9518941oab.8.1697241031086; Fri, 13 Oct
 2023 16:50:31 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:50:31 -0700
In-Reply-To: <0000000000006a3d0d060785f027@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c19b400607a1b88c@google.com>
Subject: Re: [syzbot] [net?] [wireless?] WARNING in ieee80211_bss_info_change_notify
 (2)
From: syzbot <syzbot+dd4779978217b1973180@syzkaller.appspotmail.com>
To: SHA-cyfmac-dev-list@infineon.com, ajay.kathat@microchip.com, 
	amitkarwar@gmail.com, aspriel@gmail.com, brcm80211-dev-list.pdl@broadcom.com, 
	claudiu.beznea@microchip.com, davem@davemloft.net, edumazet@google.com, 
	franky.lin@broadcom.com, ganapathi017@gmail.com, geomatsi@gmail.com, 
	gregkh@linuxfoundation.org, hante.meuleman@broadcom.com, 
	huxinming820@gmail.com, imitsyanko@quantenna.com, johannes.berg@intel.com, 
	johannes@sipsolutions.net, kuba@kernel.org, kvalo@kernel.org, 
	libertas-dev@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, sharvari.harisangam@nxp.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 7b0a0e3c3a88260b6fcb017e49f198463aa62ed1
Author: Johannes Berg <johannes.berg@intel.com>
Date:   Thu Apr 14 14:50:57 2022 +0000

    wifi: cfg80211: do some rework towards MLO link APIs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13fdd89d680000
start commit:   ce583d5fb9d3 Merge tag 'for-v6.6-rc2' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1003d89d680000
console output: https://syzkaller.appspot.com/x/log.txt?x=17fdd89d680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d83dadac33c08b7
dashboard link: https://syzkaller.appspot.com/bug?extid=dd4779978217b1973180
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157a58e5680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=170cf875680000

Reported-by: syzbot+dd4779978217b1973180@syzkaller.appspotmail.com
Fixes: 7b0a0e3c3a88 ("wifi: cfg80211: do some rework towards MLO link APIs")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
