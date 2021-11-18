Received: from smtprelay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BE2C83
	for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 06:38:22 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 45AF11842B032
	for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 06:21:10 +0000 (UTC)
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id B8DEB87CB7;
	Thu, 18 Nov 2021 06:21:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id 9841F2000267;
	Thu, 18 Nov 2021 06:20:55 +0000 (UTC)
Message-ID: <cec5c6cf048eacec2c8204b99c5708996fa9f178.camel@perches.com>
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Dmitry Osipenko
 <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Anton Bambura
 <jenneron@protonmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org,  linux-staging@lists.linux.dev,
 linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Wed, 17 Nov 2021 22:21:00 -0800
In-Reply-To: <20211118061418.GO26989@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
	 <20211114222353.22435-2-digetx@gmail.com>
	 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
	 <20211115124402.GE26989@kadam>
	 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
	 <20211115154858.GG27562@kadam>
	 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
	 <20211118061418.GO26989@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9841F2000267
X-Spam-Status: No, score=1.39
X-Stat-Signature: 8kqammgfhwcnnqfwjc8duj68xspb51yo
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+OSmK8mQAhbe4KvTJ9/kWsrKhlkfyqzyw=
X-HE-Tag: 1637216455-502629

On Thu, 2021-11-18 at 09:14 +0300, Dan Carpenter wrote:
> It's not hard to run Smatch yourself...
> 
> Depending on if you're on a apt distro or yum distro then fetch the
> dependencies with one of the follow commands:
> apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
> yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
> 
> git clone https://github.com/error27/smatch
> cd smatch
> make
> cd ~/kernel_source/
> ~/smatch/smatch_scripts/kchecker drivers/subsystem/

Might want to stick something in Documentation about that.

