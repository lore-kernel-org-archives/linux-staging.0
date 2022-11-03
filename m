Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABEE63A0
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ptLyux4fLATefTGtR5/rTCTg3yAIJ0BZdM4SgFFG07M=; b=NgVCKAS2dm33GVRSg2oZ/SQyNE
	6PotzhsDkmCMkhQbqG+wpOlN0xuX2+RMwRxipuNhYxdPgFQ7DyLUfY0l7lK0FT2xTK6WJt0rfxI+I
	x9giLPlIkCwWWX9dfAfQ7nynBsdWsrHN+oaJxICoakB8fOCoFY79dMylaSOaZjMKGl4A106WisaBm
	fCN94+AYuX2hEvjGFy/bQaV5n5L8iDGJA6HUz5wOATuVZsycjjJ3kI3B49jZGXhXYuAD9t7JNtprM
	vZRWhGB4wr9nR1py/RzBSM5KcL8JrfTMzCsymBg6w8mRr8XuggRQKBlTo5gYAvBAvWB/HhrYd7v6p
	mzE9Rl5Q==;
Received: from c-67-160-137-253.hsd1.or.comcast.net ([67.160.137.253] helo=[10.0.0.152])
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqecy-001BTT-0V; Thu, 03 Nov 2022 18:07:44 +0000
Message-ID: <a916c06e-a9b5-1cd2-2da7-ac8e46b512c9@infradead.org>
Date: Thu, 3 Nov 2022 11:07:43 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Larry.Finger@lwfinger.net, wlanfae@realtek.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: staging: rtl8192e: build warning on HZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

FYI:

When CONFIG_HZ=24 (arch/mips/):

../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtl819x_translate_scan':
../drivers/staging/rtl8192e/rtllib_wx.c:220:57: warning: division by zero [-Wdiv-by-zero]
  220 |                       (jiffies - network->last_scanned) / (HZ / 100));
      |                                                         ^
In file included from ../include/linux/skbuff.h:45,
                 from ../include/linux/if_ether.h:19,
                 from ../include/linux/etherdevice.h:20,
                 from ../drivers/staging/rtl8192e/rtllib_wx.c:18:
../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtllib_wx_get_scan':
../drivers/staging/rtl8192e/rtllib_wx.c:261:70: warning: division by zero [-Wdiv-by-zero]
  261 |                                    (jiffies - network->last_scanned) /
      |   

-- 
~Randy
