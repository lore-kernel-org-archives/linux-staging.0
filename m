Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5C7C
	for <linux-staging@lists.linux.dev>; Mon,  5 Dec 2022 12:45:55 +0000 (UTC)
Received: from smtpclient.apple ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 2B5CXVWb009741-2B5CXVWd009741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 5 Dec 2022 20:33:32 +0800
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] staging: vme_user: fix coding style
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <Y43igvotWRmQzn+e@kroah.com>
Date: Mon, 5 Dec 2022 20:33:31 +0800
Cc: Martyn Welch <martyn@welchs.me.uk>,
        Manohar Vanga <manohar.vanga@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Mingyi Kang <jerrykang026@gmail.com>, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <20D111E5-E0F5-48B4-9391-B4DDDFD4C273@hust.edu.cn>
References: <20221126125642.16358-1-dzm91@hust.edu.cn>
 <20221126125642.16358-2-dzm91@hust.edu.cn> <Y43igvotWRmQzn+e@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-FEAS-AUTH-USER: dzm91@hust.edu.cn



> On Dec 5, 2022, at 20:22, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
>=20
> On Sat, Nov 26, 2022 at 08:56:34PM +0800, Dongliang Mu wrote:
>> Fix coding style enforced by Linux kernel
>=20
> What coding style was changed?  Please always be specific.

The commit message is imprecise. Actually, this patch only fixes the =
code indentation issue of kfree function call.

Will fix it in v2.

>=20
> thanks,
>=20
> greg k-h

