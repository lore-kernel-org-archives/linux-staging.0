Received: from smtprelay.hostedemail.com (smtprelay0025.hostedemail.com [216.40.44.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A17170
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 05:56:41 +0000 (UTC)
Received: from omf11.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id 207DE100E7B40;
	Sun,  6 Jun 2021 05:56:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id 21DBF20A295;
	Sun,  6 Jun 2021 05:56:34 +0000 (UTC)
Message-ID: <1c87140c6e580b443de5d4abafb7872c8ee3efef.camel@perches.com>
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: Remove conditions with no
 effects
From: Joe Perches <joe@perches.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sat, 05 Jun 2021 22:56:32 -0700
In-Reply-To: <20210606043552.31785-1-fmdefrancesco@gmail.com>
References: <20210606043552.31785-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.21
X-Stat-Signature: dmg97iebzw3hgcnxr5sypezfzatbybpo
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 21DBF20A295
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/CFYFNwWuc73uA2GKLBz96yRsbeiXh+2A=
X-HE-Tag: 1622958994-159737

On Sun, 2021-06-06 at 06:35 +0200, Fabio M. De Francesco wrote:
> Removed conditions with no effects. Detected by Coccinelle.

It's be good if you researched how this came to be and noted it
in the changelog.

try:

commit dc365d2cc579200bc3752ddb941e046e3a16962c
Author: Fabio Aiuto <fabioaiuto83@gmail.com>
Date:   Tue Mar 16 15:04:11 2021 +0100

    staging: rtl8723bs: remove unused code blocks conditioned by never set CONFIG_AP_WOWLAN


